extends Area2D

func _on_EnemyFlip_body_entered(body: Node) -> void:
	if "Enemy" == body.name:
		body.scale.x *= -1
		body._velocity.x = body._velocity.x * -1.0
