extends Node2D



func _on_RightPrompt_body_entered(body: Node) -> void:
	if "Player" == body.name:
		$CanvasLayer/RightLabel.visible = true
		


func _on_RightPrompt_body_exited(body: Node) -> void:
	if "Player" == body.name:
		$CanvasLayer/RightLabel.visible = false


func _on_UpPrompt_body_entered(body: Node) -> void:
	if "Player" == body.name:
		$CanvasLayer/UpLabel.visible = true


func _on_UpPrompt_body_exited(body: Node) -> void:
	if "Player" == body.name:
		$CanvasLayer/UpLabel.visible = false


func _on_LeftPrompt_body_entered(body: Node) -> void:
	if "Player" == body.name:
		$CanvasLayer/LeftLabel.visible = true


func _on_LeftPrompt_body_exited(body: Node) -> void:
	if "Player" == body.name:
		$CanvasLayer/LeftLabel.visible = false

func _on_GoldenNutCheck_body_entered(body: Node) -> void:
	if "Player" == body.name:
		$CanvasLayer/GoldenLabel.visible = false


func _on_GoldenPrompt_body_entered(body: Node) -> void:
	if "Player" == body.name:
		$CanvasLayer/GoldenLabel.visible = true
	if $GoldenNut.is_queued_for_deletion():
		$CanvasLayer/GoldenLabel.visible = false



func _on_GoldenPrompt_body_exited(body: Node) -> void:
	if "Player" == body.name:
		$CanvasLayer/GoldenLabel.visible = false
