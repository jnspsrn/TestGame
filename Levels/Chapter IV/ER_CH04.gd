extends "res://Levels/Level.gd"

onready var engineOne = $EngineControlOne
onready var engineTwo = $EngineControlTwo
onready var engineThree = $EngineControlThree
onready var engineFour = $EngineControlFour

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	engineOne.conenct("is_solved", self, "_on_is_solved")
	engineTwo.conenct("is_solved", self, "_on_is_solved")
	engineThree.conenct("is_solved", self, "_on_is_solved")
	engineFour.conenct("is_solved", self, "_on_is_solved")

func _on_is_solved(object):
	match object:
		engineOne:
			if not ProgressManager.chapter_4_progress['is_engineOne_completed']:
				engineOne.interaction()
				ProgressManager.chapter_4_progress['is_engineOne_completed'] = true
		engineTwo:
			if not ProgressManager.chapter_4_progress['is_engineTwo_completed']:
				engineTwo.interaction()
				ProgressManager.chapter_4_progress['is_engineTwo_completed'] = true
		engineThree:
			if not ProgressManager.chapter_4_progress['is_engineThree_completed']:
				engineThree.interaction()
				ProgressManager.chapter_4_progress['is_engineThree_completed'] = true
		engineFour:
			if not ProgressManager.chapter_4_progress['is_engineFour_completed']:
				engineFour.interaction()
				ProgressManager.chapter_4_progress['is_engineFour_completed'] = true
	if (ProgressManager.chapter_4_progress['is_engineOne_completed']
	and ProgressManager.chapter_4_progress['is_engineTwo_completed']
	and ProgressManager.chapter_4_progress['is_engineThree_completed']
	and ProgressManager.chapter_4_progress['is_engineFour_completed']
	):
		ProgressManager.chapter_4_progress['is_er_ch04_completed'] = true
