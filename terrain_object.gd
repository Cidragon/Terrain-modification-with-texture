extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y >= 640:
		Signals.add_value_to_terrain.emit(get_terrain_index())
		queue_free()

func get_terrain_index() -> int:
	return position.x / Main.TEXTURE_SIZE
