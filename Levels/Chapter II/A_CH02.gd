extends "res://Levels/Level.gd"

onready var sds_01 = $SuitDockingStations/SDS_01
onready var sds_02 = $SuitDockingStations/SDS_02
onready var sds_03 = $SuitDockingStations/SDS_03
onready var sds_04 = $SuitDockingStations/SDS_04

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	sds_01.connect("is_solved", self, "_on_is_solved")
	sds_02.connect("is_solved", self, "_on_is_solved")
	sds_03.connect("is_solved", self, "_on_is_solved")
	sds_04.connect("is_solved", self, "_on_is_solved")

func _on_is_solved(object):
	match object:
		sds_01:
			if not ProgressManager.chapter_2_progress['is_SDS_01_completed']:
				sds_01.interaction()
				ProgressManager.chapter_2_progress['is_SDS_01_completed'] = true
		sds_02:
			if not ProgressManager.chapter_2_progress['is_SDS_02_completed']:
				sds_02.interaction()
				ProgressManager.chapter_2_progress['is_SDS_02_completed'] = true
		sds_03:
			if not ProgressManager.chapter_2_progress['is_SDS_03_completed']:
				sds_03.interaction()
				ProgressManager.chapter_2_progress['is_SDS_03_completed'] = true
		sds_04:
			if not ProgressManager.chapter_2_progress['is_SDS_04_completed']:
				sds_04.interaction()
				ProgressManager.chapter_2_progress['is_SDS_04_completed'] = true
	if(ProgressManager.chapter_2_progress['is_SDS_01_completed']
	and ProgressManager.chapter_2_progress['is_SDS_02_completed']
	and ProgressManager.chapter_2_progress['is_SDS_03_completed']
	and ProgressManager.chapter_2_progress['is_SDS_04_completed']
	):
		Utils.prompt_dialogue("ch02_story_dialogue_28.json")
		ProgressManager.chapter_2_progress['is_a_ch02_completed'] = true
		
