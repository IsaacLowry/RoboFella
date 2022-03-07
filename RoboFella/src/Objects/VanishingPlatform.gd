extends ColorRect

func _on_Area2D_body_entered(body: Node) -> void:
	if "Player" == body.name:
		$Area2D/CollisionShape2D/AnimationPlayer.play("Vanish")
