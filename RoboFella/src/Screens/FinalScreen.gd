extends Control

onready var score: Label = get_node("VSplitContainer/ScoreLabel")
onready var unharmed: Label = get_node("VSplitContainer/unharmedLabel")
onready var bonus: Label = get_node("Bonus")

func _ready() -> void:

	if UserData.deaths == 0:
		unharmed.text = unharmed.text % ["completely"]
		bonus.text = bonus.text % ["You Received 100 Extra Nuts For Staying Alive!"]
		UserData.scoreTotal += 100
		score.text = score.text % [UserData.scoreTotal, UserData.deaths, "times"]
	elif UserData.deaths == 1:
		unharmed.text = unharmed.text % ["almost"]
		bonus.text = bonus.text % ["You Received 20 Extra Nuts For Only Dying Once!"]
		UserData.scoreTotal += 20
		score.text = score.text % [UserData.scoreTotal, UserData.deaths, "time"]
	else:
		unharmed.text = unharmed.text % ["fairly"]
		bonus.text = bonus.text % ["Try Escaping the factory without dying for extra Nuts"]
		score.text = score.text % [UserData.scoreTotal, UserData.deaths, "times"]
	
