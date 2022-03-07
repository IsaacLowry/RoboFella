extends Area2D
onready var play_animation: AnimationPlayer = get_node("AnimationPlayer")
export var collect: = 1

func _on_body_entered(body: Node) -> void:
	if body.visible == true:
		$NutNoise.play()
		play_animation.play("fade")
	UserData.score += collect
	
	if body.visible == false:
		UserData.score = 0
