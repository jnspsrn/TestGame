extends "res://Levels/Level.gd"

onready var engineControlOne = $EngineControlOne
onready var engineControlTwo = $EngineControlTwo
onready var engineControlThree = $EngineControlThree
onready var engineControlFour = $EngineControlFour

func _ready():
	call_deferred("set_engine_panel")
	if not ProgressManager.chapter_1_progress['prompted_dialogue_22']:
		yield(Utils.prompt_dialogue("ch01_story_dialogue_22.json"), "completed")
		ProgressManager.chapter_1_progress['prompted_dialogue_22'] = true

func _on_is_solved(object):
	match object:
		engineControlOne:
			if not ProgressManager.chapter_1_progress['is_engineControlOne_unlocked']:
				engineControlOne.interaction()
				ProgressManager.chapter_1_progress['is_engineControlOne_unlocked'] = true
		engineControlTwo:
			if not ProgressManager.chapter_1_progress['is_engineControlTwo_unlocked']:
				engineControlTwo.interaction()
				ProgressManager.chapter_1_progress['is_engineControlTwo_unlocked'] = true
		engineControlThree:
			if not ProgressManager.chapter_1_progress['is_engineControlThree_unlocked']:
				engineControlThree.interaction()
				ProgressManager.chapter_1_progress['is_engineControlThree_unlocked'] = true
		engineControlFour:
			if not ProgressManager.chapter_1_progress['is_engineControlFour_unlocked']:
				engineControlFour.interaction()
				ProgressManager.chapter_1_progress['is_engineControlFour_unlocked'] = true
	if (ProgressManager.chapter_1_progress['is_engineControlOne_unlocked']
		and ProgressManager.chapter_1_progress['is_engineControlTwo_unlocked']
		and ProgressManager.chapter_1_progress['is_engineControlThree_unlocked']
		and ProgressManager.chapter_1_progress['is_engineControlFour_unlocked']):
			ProgressManager.chapter_1_progress['is_ER_CH01_completed'] = true
			yield(Utils.prompt_dialogue("ch01_story_dialogue_23.json"), "completed")
			Utils.next_chapter("res://Levels/Chapter II/CC_CH02.tscn", Vector2(590,21))
			

func set_engine_panel():
	if ProgressManager.chapter_1_progress['is_ER_CH01_completed']:
		engineControlOne.update_puzzle(true)
		engineControlOne.set_interactable()
		engineControlTwo.update_puzzle(true)
		engineControlTwo.set_interactable()
		engineControlThree.update_puzzle(true)
		engineControlThree.set_interactable()
		engineControlFour.update_puzzle(true)
		engineControlFour.set_interactable()
	else:
		engineControlOne.connect("is_solved", self, "_on_is_solved")
		engineControlTwo.connect("is_solved", self, "_on_is_solved")
		engineControlThree.connect("is_solved", self, "_on_is_solved")
		engineControlFour.connect("is_solved", self, "_on_is_solved")
