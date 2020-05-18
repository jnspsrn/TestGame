extends "res://Levels/Level.gd"

onready var controlPanelOne = $ControlPanels/ControlPanelOne
onready var controlPanelTwo = $ControlPanels/ControlPanelTwo
onready var controlPanelThree = $ControlPanels/ControlPanelThree
onready var controlPanelFour = $ControlPanels/ControlPanelFour
onready var ss_Waypoint = $SS_Waypoint/CollisionShape2D

func _ready():
	controlPanelOne.connect("is_solved", self, "_on_is_solved")
	controlPanelTwo.connect("is_solved", self, "_on_is_solved")
	controlPanelThree.connect("is_solved", self, "_on_is_solved")
	controlPanelFour.connect("is_solved", self, "_on_is_solved")
	ss_Waypoint.disabled = true
	
	if not ProgressManager.chapter_1_progress['prompted_dialogue_16']:
		Utils.prompt_dialogue("ch01_story_dialogue_16.json")
		ProgressManager.chapter_1_progress['prompted_dialogue_16'] = true

func _on_is_solved(object):
	match object:
		controlPanelOne:
			if not ProgressManager.chapter_1_progress['is_controlPanelOne_unlocked']:
				controlPanelOne.interaction()
				ProgressManager.chapter_1_progress['is_controlPanelOne_unlocked'] = true
		controlPanelTwo:
			if not ProgressManager.chapter_1_progress['is_controlPanelTwo_unlocked']:
				controlPanelTwo.interaction()
				ProgressManager.chapter_1_progress['is_controlPanelTwo_unlocked'] = true
		controlPanelThree:
			if not ProgressManager.chapter_1_progress['is_controlPanelThree_unlocked']:
				controlPanelThree.interaction()
				ProgressManager.chapter_1_progress['is_controlPanelThree_unlocked'] = true
		controlPanelFour:
			if not ProgressManager.chapter_1_progress['is_controlPanelFour_unlocked']:
				controlPanelFour.interaction()
				ProgressManager.chapter_1_progress['is_controlPanelFour_unlocked'] = true
	if (ProgressManager.chapter_1_progress['is_controlPanelOne_unlocked']
		and ProgressManager.chapter_1_progress['is_controlPanelTwo_unlocked']
		and ProgressManager.chapter_1_progress['is_controlPanelThree_unlocked']
		and ProgressManager.chapter_1_progress['is_controlPanelFour_unlocked']):
			ProgressManager.chapter_1_progress['is_RR_CH01_completed'] = true
			Utils.prompt_dialogue("ch01_story_dialogue_17.json")
