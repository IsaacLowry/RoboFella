extends Area2D
onready var play_animation: AnimationPlayer = get_node("AnimationPlayer")
export var collect: = 10

func _on_body_entered(body: Node) -> void:
	if body.visible == true:
		$NutNoise.play()
		play_animation.play("Score")
		UserData.score += collect
		play_animation.play("fade")
	
	if body.visible == false:
		UserData.score = 0

