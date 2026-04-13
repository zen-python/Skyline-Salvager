extends RefCounted
class_name SalvageBeam

signal lock_acquired(crate)
signal lock_cleared(reason)
signal pull_started(crate)
signal pull_step_completed(crate, from_tile, to_tile)
signal pull_failed(reason)

const STATE_IDLE := "idle"
const STATE_LOCKED := "locked"
const STATE_PULLING := "pulling"

var salvage_grid: SalvageGrid
var rig_grid_position: Vector2i = Vector2i.ZERO
var max_range: int = 4
var pull_strength: int = 1
var state: String = STATE_IDLE
var target_crate: SalvageCrate = null
var last_failure_reason: String = ""


func configure(grid: SalvageGrid, rig_tile: Vector2i = Vector2i.ZERO) -> void:
	salvage_grid = grid
	rig_grid_position = rig_tile


func set_rig_grid_position(tile: Vector2i) -> void:
	rig_grid_position = tile


func has_target() -> bool:
	return target_crate != null and not target_crate.is_destroyed


func try_lock_on(crate: SalvageCrate) -> bool:
	if crate == null:
		return _reject_target("no_target")
	if not crate.is_pullable():
		return _reject_target("target_destroyed")
	if _distance_in_steps(rig_grid_position, crate.grid_position) > max_range:
		return _reject_target("target_out_of_range")

	_unbind_target()
	target_crate = crate
	_bind_target(crate)
	last_failure_reason = ""
	state = STATE_LOCKED
	lock_acquired.emit(crate)
	return true


func activate_beam() -> bool:
	if not has_target():
		return _reject_target("target_invalid")

	state = STATE_PULLING
	pull_started.emit(target_crate)
	return true


func tick_pull() -> bool:
	if state != STATE_PULLING:
		return _reject_target("beam_not_active")
	if not has_target():
		clear_lock("target_destroyed")
		pull_failed.emit("target_destroyed")
		return false

	var from_tile := target_crate.grid_position
	var to_tile := _next_step_toward_rig(from_tile)
	if to_tile == from_tile:
		clear_lock("target_already_aligned")
		return false

	target_crate.move_to(to_tile)
	if salvage_grid != null:
		salvage_grid.apply_pull_stress(to_tile, pull_strength, "salvage_beam")

	pull_step_completed.emit(target_crate, from_tile, to_tile)

	if to_tile == rig_grid_position:
		clear_lock("target_retrieved")

	return true


func release_beam(reason: String = "beam_released") -> void:
	clear_lock(reason)


func clear_lock(reason: String = "lock_cleared") -> void:
	_unbind_target()
	target_crate = null
	state = STATE_IDLE
	lock_cleared.emit(reason)


func _reject_target(reason: String) -> bool:
	last_failure_reason = reason
	pull_failed.emit(reason)
	return false


func _bind_target(crate: SalvageCrate) -> void:
	var destroyed_callback := Callable(self, "_on_target_destroyed")
	if not crate.destroyed.is_connected(destroyed_callback):
		crate.destroyed.connect(destroyed_callback)


func _unbind_target() -> void:
	if target_crate == null:
		return

	var destroyed_callback := Callable(self, "_on_target_destroyed")
	if target_crate.destroyed.is_connected(destroyed_callback):
		target_crate.destroyed.disconnect(destroyed_callback)


func _on_target_destroyed(crate: SalvageCrate) -> void:
	if crate != target_crate:
		return

	clear_lock("target_destroyed")
	last_failure_reason = "target_destroyed"
	pull_failed.emit("target_destroyed")


func _next_step_toward_rig(from_tile: Vector2i) -> Vector2i:
	var delta := rig_grid_position - from_tile
	if delta == Vector2i.ZERO:
		return from_tile

	if abs(delta.x) >= abs(delta.y):
		return from_tile + Vector2i(int(sign(delta.x)), 0)
	return from_tile + Vector2i(0, int(sign(delta.y)))


func _distance_in_steps(a: Vector2i, b: Vector2i) -> int:
	var delta := b - a
	return abs(delta.x) + abs(delta.y)
