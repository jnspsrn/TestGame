extends "res://Levels/Level.gd"

onready var sj_01 = $SJ_01
onready var sj_02 = $SJ_02
onready var sj_03 = $SJ_03

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	sj_01.connect("is_solved", self, "_on_is_solved")
	sj_02.connect("is_solved", self, "_on_is_solved")
	sj_03.connect("is_solved", self, "_on_is_solved")

func _on_is_solved(object):
	match object:
		sj_01:
			if not ProgressManager.chapter_3_progress['is_sj_01_completed']:
				sj_01.interaction()
				ProgressManager.chapter_3_progress['is_sj_01_completed'] = true
		sj_02:
			if not ProgressManager.chapter_3_progress['is_sj_02_completed']:
				sj_02.interaction()
				ProgressManager.chapter_3_progress['is_sj_02_completed'] = true
		sj_03:
			if not ProgressManager.chapter_3_progress['is_sj_03_completed']:
				sj_03.interaction()
				ProgressManager.chapter_3_progress['is_sj_03_completed'] = true
	if(ProgressManager.chapter_3_progress['is_sj_01_completed']
	and ProgressManager.chapter_3_progress['is_sj_02_completed']
	and ProgressManager.chapter_3_progress['is_sj_03_completed']
	):
		ProgressManager.chapter_3_progress['is_ds_ch03_completed'] = true
		Utils.prompt_dialogue("ch03_story_dialogue_45.json")
