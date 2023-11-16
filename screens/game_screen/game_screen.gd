extends Control


func _on_test_day_button_pressed():
	print("presed.")
	get_tree().call_group("game_objects","_pass_day")
