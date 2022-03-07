extends Control
onready var scene_tree: = get_tree()
onready var pause_screen: ColorRect = get_node("PauseScreen")
onready var score: Label = get_node("ScoreLabel")
onready var pause_title: Label = get_node("PauseScreen/PauseTitle")
onready var pause_title2: Label = get_node("PauseScreen/PauseTitle2")

var pause: = false setget set_pause

func _ready() -> void:
	var _nutError = UserData.connect("nut_count", self, "update_UI")
	var _deathError = UserData.connect("death_count", self, "_UserData_player_dead")
	update_UI()

func _UserData_player_dead() -> void:
	self.pause = true
	UserData.score = 0
	pause_title.text = "Robo Fella Died!"
	pause_title2.text = pause_title.text
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and pause_title.text != "Robo Fella Died!":
		self.pause = not pause
		scene_tree.set_input_as_handled()



func update_UI() -> void:
	score.text = "Nut Count: %s" % UserData.score

func set_pause(value: bool) -> void:
	pause = value
	scene_tree.paused = value
	pause_screen.visible = value
