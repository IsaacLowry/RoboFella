tool
extends Button

export (String, FILE) var info_scene_path: = ""

func _on_MainMenu_button_down() -> void:
	$buttonClick.play()

func _on_MainMenu_button_up() -> void:
	if get_tree().change_scene(info_scene_path) != OK:
		print("Next scene could not be loaded: an error occurred")


func  _get_configuration_warning() -> String:
	return "Button Scene Path is empty! The next scene cannot be loaded" if not info_scene_path else ""








