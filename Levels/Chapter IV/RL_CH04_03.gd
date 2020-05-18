extends "res://Levels/Level.gd"


onready var rl_Workbench = $RL_Workbench

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	Utils.call_deferred("set_current_level_puzzles")
	rl_Workbench.connect("is_solved", self, "_on_is_solved")

func _on_is_solved(object):
	if not ProgressManager.chapter_4_progress['is_rl_ch04_03_completed']:
		object.interaction()
		ProgressManager.chapter_4_progress['is_rl_ch04_03_completed'] = true

