extends "res://Levels/Level.gd"

onready var brokenCore = $BrokenCore

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	brokenCore.connect("is_solved", self, "_on_is_solved")

func _on_is_solved(object):
	if not ProgressManager.chapter_2_progress['is_broken_core_completed']:
		brokenCore.interaction()
		ProgressManager.chapter_2_progress['is_broken_core_completed'] = true
