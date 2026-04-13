extends RefCounted
class_name SalvageCrate

signal destroyed(crate)
signal moved(crate, from_tile, to_tile)

var crate_id: String = ""
var grid_position: Vector2i = Vector2i.ZERO
var is_destroyed: bool = false


func _init(id: String = "", start_tile: Vector2i = Vector2i.ZERO) -> void:
	crate_id = id
	grid_position = start_tile


func is_pullable() -> bool:
	return not is_destroyed


func move_to(to_tile: Vector2i) -> void:
	var from_tile := grid_position
	grid_position = to_tile
	moved.emit(self, from_tile, to_tile)


func destroy() -> void:
	if is_destroyed:
		return

	is_destroyed = true
	destroyed.emit(self)
