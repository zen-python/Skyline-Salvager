extends SceneTree

const PrototypeScene = preload("res://scenes/PrototypeMain.tscn")
const SalvageCrateScript = preload("res://src/gameplay/salvage_crate.gd")


func _initialize() -> void:
	var prototype = PrototypeScene.instantiate()
	root.add_child(prototype)
	await process_frame

	var first_snapshot: Dictionary = prototype.get_stress_telegraph_snapshot()
	if not _assert(first_snapshot.state == "idle", "expected telegraph to start idle"):
		return
	if not _assert(first_snapshot.text.contains("No active stress signal."), "expected idle telegraph text"):
		return

	var crate_a = prototype.salvage_crates[0]
	if not _assert(prototype.salvage_beam.try_lock_on(crate_a), "expected first crate lock-on"):
		return
	if not _assert(prototype.salvage_beam.activate_beam(), "expected beam activation for first crate"):
		return
	if not _assert(prototype.salvage_beam.tick_pull(), "expected first pull tick to complete"):
		return

	var watch_snapshot: Dictionary = prototype.get_stress_telegraph_snapshot()
	if not _assert(watch_snapshot.state == "watch", "expected watch state after first stress event"):
		return
	if not _assert(watch_snapshot.tile == Vector2i(2, 0), "expected newest stressed tile to be [2, 0]"):
		return
	if not _assert(watch_snapshot.stress == 1, "expected stress value 1 after first pull tick"):
		return

	if not _assert(prototype.salvage_beam.tick_pull(), "expected second pull tick to complete"):
		return

	var updated_snapshot: Dictionary = prototype.get_stress_telegraph_snapshot()
	if not _assert(updated_snapshot.tile == Vector2i(1, 0), "expected telegraph to update to the newest stressed tile"):
		return

	if not _assert(prototype.salvage_beam.tick_pull(), "expected third pull tick to retrieve first crate"):
		return
	if not _assert(prototype.salvage_beam.state == prototype.salvage_beam.STATE_IDLE, "expected beam to clear after retrieval"):
		return

	var warning_crate = SalvageCrateScript.new("crate_warning", Vector2i(2, 0))
	if not _assert(prototype.salvage_beam.try_lock_on(warning_crate), "expected warning crate lock-on"):
		return
	if not _assert(prototype.salvage_beam.activate_beam(), "expected beam activation for warning crate"):
		return
	if not _assert(prototype.salvage_beam.tick_pull(), "expected warning pull tick to complete"):
		return

	var warning_snapshot: Dictionary = prototype.get_stress_telegraph_snapshot()
	if not _assert(warning_snapshot.state == "warning", "expected warning state when warning threshold is reached"):
		return
	if not _assert(warning_snapshot.tile == Vector2i(1, 0), "expected warning tile to reflect the newest stressed tile"):
		return
	if not _assert(warning_snapshot.stress == 2, "expected stress value 2 at the warning threshold"):
		return
	if not _assert(warning_snapshot.text.contains("Stress 2 / 3"), "expected threshold text in the warning panel"):
		return

	print("RUNTIME CHECK PASS: Story 002 rooftop stress telegraph")
	quit(0)


func _assert(condition: bool, message: String) -> bool:
	if condition:
		return true

	push_error("RUNTIME CHECK FAIL: %s" % message)
	quit(1)
	return false
