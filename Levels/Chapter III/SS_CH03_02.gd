extends "res://Levels/Chapter II/SS_CH02.gd"


func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	Utils.call_deferred("set_current_level_puzzles")
