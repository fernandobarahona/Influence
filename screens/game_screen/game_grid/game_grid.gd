@tool
class_name GameGrid extends GridContainer

@export var grid_size: Vector2 = Vector2(2,2) : set = _set_grid_size
@export var cell_size: Vector2 = Vector2(50,50) : set = _set_cell_size

func _ready():
	_re_create_cells()

func _set_grid_size(new_value: Vector2):
	grid_size = new_value
	_re_create_cells()

func _re_create_cells():
	@warning_ignore("narrowing_conversion")
	columns = grid_size.x
	for child in get_children():
		child.queue_free()
	for cell in grid_size.x * grid_size.y:
		var new_cell = load("res://screens/game_screen/game_grid/cell/cell.tscn").instantiate() as Cell
		new_cell.custom_minimum_size = cell_size
		new_cell.size = cell_size
		add_child(new_cell)
		if Engine.is_editor_hint() and is_inside_tree():
			new_cell.set_owner(get_tree().edited_scene_root)

func _set_cell_size(new_value: Vector2):
	cell_size = new_value
	_re_create_cells()
