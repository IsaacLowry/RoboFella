extends Button


func _on_button_down() -> void:
	$buttonClick.play()
func _on_button_up() -> void:
	UserData.score = 0
	get_tree().paused = false
	if get_tree().reload_current_scene() != OK:
		print("Could not reload scene: an error occurred")



