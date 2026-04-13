extends RefCounted

const SalvageBeam = preload("res://src/gameplay/salvage_beam.gd")
const SalvageCrate = preload("res://src/gameplay/salvage_crate.gd")
const SalvageGrid = preload("res://src/gameplay/salvage_grid.gd")


func test_lock_on_valid_target_within_range() -> void:
	var grid := SalvageGrid.new()
	var beam := SalvageBeam.new()
	var crate := SalvageCrate.new("crate_a", Vector2i(2, 0))

	beam.configure(grid, Vector2i.ZERO)

	assert(beam.try_lock_on(crate))
	assert(beam.state == SalvageBeam.STATE_LOCKED)
	assert(beam.target_crate == crate)
	assert(beam.last_failure_reason == "")


func test_invalid_target_out_of_range_gives_failure_feedback() -> void:
	var grid := SalvageGrid.new()
	var beam := SalvageBeam.new()
	var crate := SalvageCrate.new("crate_far", Vector2i(8, 0))

	beam.configure(grid, Vector2i.ZERO)

	assert(not beam.try_lock_on(crate))
	assert(beam.state == SalvageBeam.STATE_IDLE)
	assert(beam.last_failure_reason == "target_out_of_range")


func test_pull_tick_moves_target_and_emits_stress_event() -> void:
	var grid := SalvageGrid.new()
	var beam := SalvageBeam.new()
	var crate := SalvageCrate.new("crate_a", Vector2i(3, 0))

	beam.configure(grid, Vector2i.ZERO)
	assert(beam.try_lock_on(crate))
	assert(beam.activate_beam())
	assert(beam.tick_pull())

	assert(crate.grid_position == Vector2i(2, 0))
	assert(grid.get_stress(Vector2i(2, 0)) == 1)
	assert(grid.stress_events.size() == 1)


func test_destroyed_target_clears_lock_and_returns_to_idle() -> void:
	var grid := SalvageGrid.new()
	var beam := SalvageBeam.new()
	var crate := SalvageCrate.new("crate_a", Vector2i(2, 0))

	beam.configure(grid, Vector2i.ZERO)
	assert(beam.try_lock_on(crate))
	assert(beam.activate_beam())

	crate.destroy()

	assert(beam.state == SalvageBeam.STATE_IDLE)
	assert(beam.target_crate == null)
	assert(beam.last_failure_reason == "target_destroyed")
