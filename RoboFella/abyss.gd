extends Area2D

func _on_Abyss_body_entered(_body: Node) -> void:
	$FallDeath.play()
	

func player_death() -> void:
	UserData.deaths += 1



func _on_FallDeath_finished() -> void:
	player_death()
