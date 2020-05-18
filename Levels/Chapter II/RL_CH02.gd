extends "res://Levels/Level.gd"

onready var rl_Workbench = $RL_Workbench

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	rl_Workbench.connect("is_solved", self, "_on_is_solved")


func _on_is_solved(object):
	if not ProgressManager.chapter_2_progress['is_rl_ch01_workbench_completed']:
		object.interaction()
		ProgressManager.chapter_2_progress['is_rl_ch01_workbench_completed'] = true
