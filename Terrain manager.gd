extends Node2D

@export var heigth_texture : Texture2D

var heigth_sprites : Array[Sprite2D] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_terrain_width(Main.TERRAIN_MAX_WIDTH)

func update_terrain(index : int, value : int) -> void:
	if index % 2 != 0:
		var rng := RandomNumberGenerator.new()
		rng.randomize()
		var random_value : int = rng.randi_range(0,1)
		
		if random_value == 1:
			heigth_sprites[index].flip_h = true
		else:
			heigth_sprites[index].flip_h = false
	
	heigth_sprites[index].frame = value
	pass

func set_terrain_width(width : int) -> void:
	for i in range(width):
		var new_sprite : Sprite2D =  Sprite2D.new()
		new_sprite.texture = heigth_texture
		new_sprite.centered = false
		new_sprite.position = Vector2(i * Main.TEXTURE_SIZE * 2, 640 - heigth_texture.get_height())
		new_sprite.hframes = 21
		new_sprite.frame = 0
		
		heigth_sprites.append(new_sprite)
		add_child(new_sprite)
