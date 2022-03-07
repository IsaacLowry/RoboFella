extends Button

func _on_button_down() -> void:
	$buttonClick.play()

func _on_button_up() -> void:
	get_tree().quit()
