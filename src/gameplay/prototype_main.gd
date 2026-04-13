extends Node2D

const SalvageBeamScript = preload("res://src/gameplay/salvage_beam.gd")
const SalvageCrateScript = preload("res://src/gameplay/salvage_crate.gd")
const SalvageGridScript = preload("res://src/gameplay/salvage_grid.gd")
const STATE_PULLING = "pulling"

@onready var status_label: Label = $CanvasLayer/StatusLabel

var salvage_grid: Variant = null
var salvage_beam: Variant = null
var salvage_crates: Array = []
var selected_crate_index: int = 0


func _ready() -> void:
	salvage_grid = SalvageGridScript.new()
	salvage_beam = SalvageBeamScript.new()
	salvage_beam.configure(salvage_grid, Vector2i.ZERO)
	salvage_beam.lock_acquired.connect(_on_lock_acquired)
	salvage_beam.lock_cleared.connect(_on_lock_cleared)
	salvage_beam.pull_started.connect(_on_pull_started)
	salvage_beam.pull_step_completed.connect(_on_pull_step_completed)
	salvage_beam.pull_failed.connect(_on_pull_failed)
	_spawn_demo_crates()
	_refresh_status("Ready. Press [L] to lock, [Space] to pull, [K] to destroy the target, [Esc] to clear.")


func _unhandled_input(event: InputEvent) -> void:
	if event is not InputEventKey:
		return
	if not event.pressed or event.echo:
		return

	match event.keycode:
		KEY_L:
			_lock_selected_crate()
		KEY_SPACE:
			_pull_selected_crate()
		KEY_K:
			_destroy_selected_crate()
		KEY_ESCAPE:
			salvage_beam.release_beam()


func _spawn_demo_crates() -> void:
	salvage_crates = [
		SalvageCrateScript.new("crate_a", Vector2i(3, 0)),
		SalvageCrateScript.new("crate_b", Vector2i(2, 2)),
	]


func _current_crate():
	if salvage_crates.is_empty():
		return null
	return salvage_crates[selected_crate_index]


func _lock_selected_crate() -> void:
	var crate = _current_crate()
	if crate == null:
		_refresh_status("No crate available to lock.")
		return

	if salvage_beam.try_lock_on(crate):
		_refresh_status("Locked %s at %s." % [crate.crate_id, crate.grid_position])


func _pull_selected_crate() -> void:
	if salvage_beam.state != STATE_PULLING:
		if not salvage_beam.activate_beam():
			return

	salvage_beam.tick_pull()


func _destroy_selected_crate() -> void:
	var crate = _current_crate()
	if crate == null:
		return

	crate.destroy()
	_refresh_status("Destroyed %s to simulate collapse invalidation." % crate.crate_id)


func _on_lock_acquired(crate) -> void:
	_refresh_status("Beam locked on %s at %s." % [crate.crate_id, crate.grid_position])


func _on_lock_cleared(reason: String) -> void:
	_refresh_status("Beam returned to idle: %s." % reason)


func _on_pull_started(crate) -> void:
	_refresh_status("Pull started for %s." % crate.crate_id)


func _on_pull_step_completed(crate, from_tile: Vector2i, to_tile: Vector2i) -> void:
	var stress = salvage_grid.get_stress(to_tile)
	_refresh_status("Pulled %s from %s to %s. Stress at tile is now %d." % [crate.crate_id, from_tile, to_tile, stress])


func _on_pull_failed(reason: String) -> void:
	_refresh_status("Pull failed: %s." % reason)


func _refresh_status(message: String) -> void:
	status_label.text = "Skyline Salvager Prototype\n%s" % message
