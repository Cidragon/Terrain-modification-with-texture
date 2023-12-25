extends Node2D

@export var height_texture : Texture2D
@export var tile_texture : Texture2D

var height_sprites : Array[Sprite2D] = []

func _ready() -> void:
	set_terrain_width_2(Main.TERRAIN_MAX_WIDTH)

func update_terrain(index : int, value : int) -> void:
	height_sprites[index].scale.y = value
	height_sprites[index].position.y = 636 - (4 * (value-1))

func set_terrain_width(width : int) -> void:
	for i in range(width):
		var new_sprite : Sprite2D =  Sprite2D.new()
		new_sprite.texture = height_texture
		new_sprite.centered = false
		new_sprite.position = Vector2(i * Main.TEXTURE_SIZE * 2, 640 - height_texture.get_height())
		new_sprite.hframes = 21
		new_sprite.frame = 0
		
		height_sprites.append(new_sprite)
		add_child(new_sprite)

func set_terrain_width_2(width : int) -> void:
	for i in range(width):
		var new_sprite : Sprite2D = Sprite2D.new()
		new_sprite.texture = tile_texture
		new_sprite.centered = false
		new_sprite.position = Vector2(i * Main.TEXTURE_SIZE, 636)
		new_sprite.scale = Vector2(1,0)
		height_sprites.append(new_sprite)
		add_child(new_sprite)
