extends Node2D

export var cog2_speed = 0.05
export var cog3_speed = 0.05


func _physics_process(_delta: float) -> void:
	$Tilemaps/LevelCog2.rotate(cog2_speed)
	$Tilemaps/LevelCog3.rotate(cog3_speed)
