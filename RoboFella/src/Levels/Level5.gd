extends Node2D
export var cog_speed = 0.05


func _physics_process(_delta: float) -> void:
	$Tilemaps/LevelCog.rotate(cog_speed)
