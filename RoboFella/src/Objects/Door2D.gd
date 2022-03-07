tool
extends Area2D

export var next_level: PackedScene
onready var play_animation: AnimationPlayer = get_node("AnimationPlayer")

func _on_body_entered(_body: Node) -> void:
	UserData.scoreTotal += UserData.score
	UserData.score = 0
	$DoorCreak.play()
	player_teleport()
	
func  _get_configuration_warning() -> String:
	return "Next Level is empty! The next scene cannot be loaded" if not next_level else ""

func player_teleport() -> void:
	play_animation.play("fade")
	yield(play_animation, "animation_finished")
	if get_tree().change_scene_to(next_level) != OK:
		print("Next scene could not be loaded: an error occurred")


