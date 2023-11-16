class_name GameObject extends Control

const SIZE_POSITION_REFERENCE : Vector2 = Vector2(50,50)

func _ready():
	add_to_group("game_objects")

func _pass_day():
	printt("day_pased")
