extends Node2D

const STATE_IDLE := "idle"
const STATE_LOCKED := "locked"
const STATE_PULLING := "pulling"

@export var tile_size: float = 96.0
@export var tile_gap: float = 8.0
@export var grid_size: Vector2i = Vector2i(7, 5)
@export var grid_origin: Vector2 = Vector2(168.0, 110.0)
@export var rooftop_color: Color = Color(0.15, 0.18, 0.24)
@export var rooftop_edge_color: Color = Color(0.37, 0.45, 0.57)
@export var selection_color: Color = Color(0.54, 0.88, 1.0)
@export var lock_color: Color = Color(0.48, 0.95, 1.0)
@export var pull_color: Color = Color(1.0, 0.61, 0.24)
@export var watch_stress_color: Color = Color(0.55, 0.83, 1.0)
@export var warning_stress_color: Color = Color(1.0, 0.78, 0.31)
@export var critical_stress_color: Color = Color(1.0, 0.42, 0.42)

var rig_tile: Vector2i = Vector2i.ZERO
var beam_state: String = STATE_IDLE
var warning_threshold: int = 2
var collapse_threshold: int = 3

var has_selected_tile: bool = false
var selected_tile: Vector2i = Vector2i.ZERO
var has_target_tile: bool = false
var target_tile: Vector2i = Vector2i.ZERO

var crates: Array[Dictionary] = []
var stress_tiles: Dictionary = {}
var stress_pulses: Array[Dictionary] = []

var has_pull_flash: bool = false
var pull_flash_from: Vector2i = Vector2i.ZERO
var pull_flash_to: Vector2i = Vector2i.ZERO
var pull_flash_age: float = 0.0

var elapsed_time: float = 0.0


func _ready() -> void:
	set_process(true)


func update_state(next_state: Dictionary) -> void:
	rig_tile = next_state.get("rig_tile", Vector2i.ZERO)
	beam_state = String(next_state.get("beam_state", STATE_IDLE))
	warning_threshold = int(next_state.get("warning_threshold", warning_threshold))
	collapse_threshold = int(next_state.get("collapse_threshold", collapse_threshold))

	var selected_value = next_state.get("selected_tile", null)
	has_selected_tile = selected_value != null
	if has_selected_tile:
		selected_tile = selected_value

	var target_value = next_state.get("target_tile", null)
	has_target_tile = target_value != null
	if has_target_tile:
		target_tile = target_value

	crates.clear()
	for entry in next_state.get("crates", []):
		crates.append({
			"id": String(entry.get("id", "")),
			"tile": entry.get("tile", Vector2i.ZERO),
			"destroyed": bool(entry.get("destroyed", false)),
			"selected": bool(entry.get("selected", false)),
		})

	stress_tiles.clear()
	for entry in next_state.get("stress_tiles", []):
		stress_tiles[entry.get("tile", Vector2i.ZERO)] = int(entry.get("value", 0))

	queue_redraw()


func push_stress_pulse(tile: Vector2i, stress_value: int, severity: String) -> void:
	stress_pulses.append({
		"tile": tile,
		"stress": stress_value,
		"severity": severity,
		"age": 0.0,
	})
	queue_redraw()


func flash_pull_step(from_tile: Vector2i, to_tile: Vector2i) -> void:
	pull_flash_from = from_tile
	pull_flash_to = to_tile
	pull_flash_age = 0.0
	has_pull_flash = true
	queue_redraw()


func _process(delta: float) -> void:
	elapsed_time += delta
	var has_active_animation := beam_state != STATE_IDLE

	for pulse in stress_pulses:
		pulse["age"] = float(pulse.get("age", 0.0)) + delta
		if float(pulse["age"]) < 1.35:
			has_active_animation = true

	while not stress_pulses.is_empty() and float(stress_pulses[0].get("age", 0.0)) >= 1.35:
		stress_pulses.remove_at(0)

	if has_pull_flash:
		pull_flash_age += delta
		if pull_flash_age >= 0.5:
			has_pull_flash = false
		else:
			has_active_animation = true

	if has_active_animation:
		queue_redraw()


func _draw() -> void:
	_draw_backdrop()
	_draw_rooftop_body()
	_draw_tiles()
	_draw_stress_pulses()
	_draw_pull_flash()
	_draw_beam()
	_draw_rig()
	_draw_crates()


func _draw_backdrop() -> void:
	draw_rect(Rect2(Vector2.ZERO, Vector2(1280.0, 720.0)), Color(0.05, 0.07, 0.1))
	draw_circle(Vector2(1040.0, 132.0), 230.0, Color(0.12, 0.21, 0.31, 0.22))
	draw_circle(Vector2(220.0, 600.0), 190.0, Color(0.18, 0.12, 0.26, 0.18))

	for index in range(7):
		var width := 72.0 + float(index % 3) * 18.0
		var height := 120.0 + float(index * 22)
		var x := 32.0 + float(index * 168)
		var y := 720.0 - height
		draw_rect(Rect2(Vector2(x, y), Vector2(width, height)), Color(0.07, 0.1, 0.15, 0.7))


func _draw_rooftop_body() -> void:
	var body_position := grid_origin - Vector2(34.0, 34.0)
	var body_size := Vector2(
		float(grid_size.x) * tile_size + float(grid_size.x - 1) * tile_gap + 68.0,
		float(grid_size.y) * tile_size + float(grid_size.y - 1) * tile_gap + 68.0
	)
	draw_rect(Rect2(body_position + Vector2(0.0, 16.0), body_size), Color(0.01, 0.02, 0.04, 0.42))
	draw_rect(Rect2(body_position, body_size), Color(0.08, 0.1, 0.14))
	draw_rect(Rect2(body_position, body_size), rooftop_edge_color, false, 3.0)


func _draw_tiles() -> void:
	for y in range(grid_size.y):
		for x in range(grid_size.x):
			var tile := Vector2i(x, y)
			var rect := _tile_rect(tile)
			var tile_color := _tile_color(tile)
			draw_rect(rect, tile_color)
			draw_rect(rect, Color(1.0, 1.0, 1.0, 0.08), false, 2.0)

			if has_selected_tile and tile == selected_tile:
				draw_rect(rect.grow(3.0), selection_color, false, 3.0)

			if has_target_tile and tile == target_tile:
				var target_color := lock_color if beam_state != STATE_PULLING else pull_color
				draw_rect(rect.grow(7.0), Color(target_color.r, target_color.g, target_color.b, 0.7), false, 4.0)


func _draw_stress_pulses() -> void:
	for pulse in stress_pulses:
		var age: float = float(pulse.get("age", 0.0))
		var alpha: float = clampf(1.0 - age / 1.35, 0.0, 1.0)
		var center: Vector2 = _tile_center(pulse.get("tile", Vector2i.ZERO))
		var pulse_color: Color = _stress_color(String(pulse.get("severity", "watch")))
		var ring_color: Color = Color(pulse_color.r, pulse_color.g, pulse_color.b, 0.65 * alpha)
		var fill_color: Color = Color(pulse_color.r, pulse_color.g, pulse_color.b, 0.12 * alpha)
		var radius: float = 20.0 + age * 84.0
		draw_circle(center, 24.0 + age * 22.0, fill_color)
		draw_arc(center, radius, 0.0, TAU, 48, ring_color, 4.0)
		draw_arc(center, radius * 0.65, 0.0, TAU, 48, Color(ring_color.r, ring_color.g, ring_color.b, ring_color.a * 0.55), 2.0)


func _draw_pull_flash() -> void:
	if not has_pull_flash:
		return

	var alpha: float = clampf(1.0 - pull_flash_age / 0.5, 0.0, 1.0)
	var from_center: Vector2 = _tile_center(pull_flash_from)
	var to_center: Vector2 = _tile_center(pull_flash_to)
	draw_line(from_center, to_center, Color(1.0, 0.94, 0.82, 0.18 * alpha), 18.0, true)
	draw_line(from_center, to_center, Color(1.0, 0.78, 0.42, 0.85 * alpha), 8.0, true)


func _draw_beam() -> void:
	if not has_target_tile:
		return

	var start := _tile_center(rig_tile)
	var finish := _tile_center(target_tile)
	var wave := 0.5 + 0.5 * sin(elapsed_time * 9.0)
	var beam_color := _beam_color()
	draw_line(start, finish, Color(beam_color.r, beam_color.g, beam_color.b, 0.16), 18.0, true)
	draw_line(start, finish, beam_color, 5.0 + wave * 3.0, true)

	for index in range(3):
		var offset := fposmod(elapsed_time * 1.4 + float(index) * 0.24, 1.0)
		var orb_position := start.lerp(finish, offset)
		draw_circle(orb_position, 4.5 + wave * 2.5, Color(0.98, 1.0, 1.0, 0.52))


func _draw_rig() -> void:
	var center := _tile_center(rig_tile)
	draw_circle(center + Vector2(0.0, 8.0), 26.0, Color(0.02, 0.03, 0.04, 0.42))
	draw_circle(center, 24.0, Color(0.12, 0.16, 0.2))
	draw_circle(center, 18.0, Color(0.26, 0.75, 0.98))

	var arm_points := PackedVector2Array([
		center + Vector2(-12.0, 0.0),
		center + Vector2(0.0, -18.0),
		center + Vector2(12.0, 0.0),
		center + Vector2(0.0, 18.0),
	])
	draw_colored_polygon(arm_points, Color(0.9, 0.97, 1.0))


func _draw_crates() -> void:
	for crate in crates:
		var tile: Vector2i = crate.get("tile", Vector2i.ZERO)
		var center: Vector2 = _tile_center(tile)
		var base_rect: Rect2 = Rect2(center - Vector2(23.0, 20.0), Vector2(46.0, 40.0))
		var is_destroyed := bool(crate.get("destroyed", false))
		var is_selected := bool(crate.get("selected", false))
		var is_targeted := has_target_tile and tile == target_tile and not is_destroyed

		draw_rect(Rect2(base_rect.position + Vector2(0.0, 7.0), base_rect.size), Color(0.01, 0.02, 0.04, 0.38))

		if is_destroyed:
			draw_rect(base_rect, Color(0.2, 0.16, 0.15))
			draw_line(base_rect.position, base_rect.end, Color(0.7, 0.28, 0.24), 3.0, true)
			draw_line(Vector2(base_rect.end.x, base_rect.position.y), Vector2(base_rect.position.x, base_rect.end.y), Color(0.7, 0.28, 0.24), 3.0, true)
			continue

		var fill_color := Color(0.7, 0.53, 0.26)
		if is_targeted:
			fill_color = fill_color.lerp(pull_color, 0.34)
		elif is_selected:
			fill_color = fill_color.lerp(selection_color, 0.22)

		draw_rect(base_rect, fill_color)
		draw_rect(base_rect.grow(-6.0), Color(0.86, 0.69, 0.35))
		draw_rect(base_rect, Color(0.18, 0.1, 0.05), false, 3.0)

		var band_color := Color(0.24, 0.15, 0.08)
		draw_line(base_rect.position + Vector2(0.0, 13.0), base_rect.position + Vector2(base_rect.size.x, 13.0), band_color, 3.0, true)
		draw_line(base_rect.position + Vector2(0.0, 28.0), base_rect.position + Vector2(base_rect.size.x, 28.0), band_color, 3.0, true)

		if is_selected:
			draw_rect(base_rect.grow(5.0), selection_color, false, 2.0)


func _tile_rect(tile: Vector2i) -> Rect2:
	var size := Vector2(tile_size, tile_size)
	var position := grid_origin + Vector2(
		float(tile.x) * (tile_size + tile_gap),
		float(tile.y) * (tile_size + tile_gap)
	)
	return Rect2(position, size)


func _tile_center(tile: Vector2i) -> Vector2:
	return _tile_rect(tile).get_center()


func _tile_color(tile: Vector2i) -> Color:
	var stress := int(stress_tiles.get(tile, 0))
	if stress <= 0:
		return rooftop_color

	if stress >= collapse_threshold:
		return rooftop_color.lerp(critical_stress_color, 0.52)
	if stress >= warning_threshold:
		return rooftop_color.lerp(warning_stress_color, 0.4)
	return rooftop_color.lerp(watch_stress_color, 0.28)


func _beam_color() -> Color:
	match beam_state:
		STATE_PULLING:
			return pull_color
		STATE_LOCKED:
			return lock_color
		_:
			return Color(1.0, 1.0, 1.0, 0.0)


func _stress_color(severity: String) -> Color:
	match severity:
		"critical":
			return critical_stress_color
		"warning":
			return warning_stress_color
		_:
			return watch_stress_color
