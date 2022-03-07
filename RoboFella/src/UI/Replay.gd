tool
extends Button

export (String, FILE) var button_scene_path: = ""



func _on_button_down() -> void:
	$buttonClick.play()

func _on_button_up() -> void:
	if get_tree().change_scene(button_scene_path) != OK:
		print("Next scene could not be loaded: an error occurred")
#	UserData.score = 0
#	UserData.deaths = 0
func  _get_configuration_warning() -> String:
	return "Button Scene Path is empty! The next scene cannot be loaded" if not button_scene_path else ""
	



