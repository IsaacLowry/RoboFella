extends Node

signal nut_count
signal death_count
var scoreTotal: = 0 setget set_scoreTotal
var score: = 0 setget set_score
var deaths: = 0 setget set_deaths
	

func reset() -> void:
	scoreTotal = 0
	score = 0
	deaths = 0

func set_scoreTotal(value: int) -> void:
	scoreTotal = value

func set_score(value: int) -> void:
	score = value
	emit_signal("nut_count")

func set_deaths(value: int) -> void:
	deaths = value
	emit_signal("death_count")
