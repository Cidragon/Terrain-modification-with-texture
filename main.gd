extends Node2D
class_name Main

@export var terrain_texture : Texture
@onready var terrain_manager: Node2D = %"Terrain manager"
@onready var label: Label = %Label

var terrain_heigth : Array[int] = []

const TERRAIN_MAX_WIDTH : int = 300
const TERRAIN_MAX_HEIGTH : int = 40
const TEXTURE_SIZE : int = 4

func _ready() -> void:
	Signals.add_value_to_terrain.connect(add_value_to_terrain_by_index)
	
	for i : int in range(TERRAIN_MAX_WIDTH):
		terrain_heigth.append(0)
	
func _process(delta: float) -> void:
	label.text = "FPS: " + str(Engine.get_frames_per_second())


func add_value_to_terrain_by_index(index : int) -> void:
	terrain_heigth[index] = min(terrain_heigth[index] + 1, TERRAIN_MAX_HEIGTH)
	terrain_manager.update_terrain(index, terrain_heigth[index])

