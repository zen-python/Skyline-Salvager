extends SceneTree

const SalvageBeamScript = preload("res://src/gameplay/salvage_beam.gd")
const SalvageCrateScript = preload("res://src/gameplay/salvage_crate.gd")
const SalvageGridScript = preload("res://src/gameplay/salvage_grid.gd")


func _initialize() -> void:
	var grid = SalvageGridScript.new()
	var beam = SalvageBeamScript.new()
	var crate = SalvageCrateScript.new("crate_runtime", Vector2i(3, 0))

	beam.configure(grid, Vector2i.ZERO)
	_assert(beam.try_lock_on(crate), "expected valid target lock-on")
	_assert(beam.activate_beam(), "expected beam activation")
	_assert(beam.tick_pull(), "expected one pull tick to complete")
	_assert(crate.grid_position == Vector2i(2, 0), "expected crate to move one tile toward the rig")
	_assert(grid.get_stress(Vector2i(2, 0)) == 1, "expected one stress event on the destination tile")

	crate.destroy()
	_assert(beam.state == beam.STATE_IDLE, "expected beam to return to idle after target destruction")
	_assert(beam.last_failure_reason == "target_destroyed", "expected target_destroyed failure feedback")

	print("RUNTIME CHECK PASS: Story 001 magnetic crate pull")
	quit(0)


func _assert(condition: bool, message: String) -> void:
	if condition:
		return

	push_error("RUNTIME CHECK FAIL: %s" % message)
	quit(1)
