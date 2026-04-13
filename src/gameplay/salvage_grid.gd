extends RefCounted
class_name SalvageGrid

signal stress_applied(tile, previous_value, new_value, source)

var stress_by_tile: Dictionary = {}
var stress_events: Array[Dictionary] = []


func apply_pull_stress(tile: Vector2i, amount: int = 1, source: String = "salvage_beam") -> int:
	var previous_value := get_stress(tile)
	var new_value := previous_value + amount
	var event := {
		"tile": tile,
		"previous_value": previous_value,
		"new_value": new_value,
		"source": source,
	}

	stress_by_tile[tile] = new_value
	stress_events.append(event)
	stress_applied.emit(tile, previous_value, new_value, source)
	return new_value


func get_stress(tile: Vector2i) -> int:
	return int(stress_by_tile.get(tile, 0))


func get_last_event() -> Dictionary:
	if stress_events.is_empty():
		return {}
	return stress_events[stress_events.size() - 1]
