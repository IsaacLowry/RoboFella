extends Area2D

func _on_Node2D_body_entered(_body: Node) -> void:
	$NailDeath.play()
	
func _on_NailDeath_finished() -> void:
	player_death()
	

func player_death() -> void:
	UserData.deaths += 1



