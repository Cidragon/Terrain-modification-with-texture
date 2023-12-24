extends Node2D

@export var terrain_texture : Texture
@export var physic_body_script : Script

func _process(delta: float) -> void:
	var random_index : int = get_random_value(Main.TERRAIN_MAX_WIDTH)
	
	var physics_body : RigidBody2D = RigidBody2D.new()
	physics_body.set_script(physic_body_script)
	
	var sprite = Sprite2D.new()
	sprite.centered = false
	sprite.texture = terrain_texture
	physics_body.position.x = random_index * sprite.texture.get_width() * sprite.scale.x
	physics_body.add_child(sprite)
	add_child(physics_body)
	pass

func get_random_value(max_value : int) -> int:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return rng.randi_range(0, max_value - 1)


