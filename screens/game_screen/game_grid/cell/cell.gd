@tool
class_name Cell extends Button

@export var game_object_packed_scene: PackedScene : set = _set_game_object

func _ready():
	_resize_and_position_game_object()

func _set_game_object(new_value):
	game_object_packed_scene = new_value
	var game_object = game_object_packed_scene.instantiate() as GameObject
	if Engine.is_editor_hint() and is_inside_tree():
		get_node("GameObject").replace_by(game_object)
	
func _resize_and_position_game_object():
	get_node("GameObject").position = Vector2(size.x / 2, size.y / 2)
	get_node("GameObject").scale = Vector2(size.x / GameObject.SIZE_POSITION_REFERENCE.x, size.y / GameObject.SIZE_POSITION_REFERENCE.y)

