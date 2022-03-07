extends Label

export var DisplayTextSpeed: int = 0

func _revealText():
	DisplayTextSpeed += 1
	self.visible_characters = DisplayTextSpeed

func _process(_delta: float) -> void:
	_revealText()
