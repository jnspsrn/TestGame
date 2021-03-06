extends "res://Levels/Level.gd"

onready var workbench = $Workbench

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	Utils.call_deferred("set_current_level_puzzles")
	workbench.connect("is_solved", self, "_on_is_solved")


func _on_is_solved(object):
	if not ProgressManager.chapter_3_progress['is_a_workbench_completed']:
		workbench.interaction()
		ProgressManager.chapter_3_progress['is_a_workbench_completed'] = true
