extends "res://Levels/Level.gd"

onready var wds_01 = $WeaponDockingStations/WDS_01
onready var wds_02 = $WeaponDockingStations/WDS_02
onready var wds_03 = $WeaponDockingStations/WDS_03
onready var wds_04 = $WeaponDockingStations/WDS_04

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	wds_01.connect("is_solved", self, "_on_is_solved")
	wds_02.connect("is_solved", self, "_on_is_solved")
	wds_03.connect("is_solved", self, "_on_is_solved")
	wds_04.connect("is_solved", self, "_on_is_solved")

func _on_is_solved(object):
	match object:
		wds_01:
			if not ProgressManager.chapter_2_progress['is_WDS_01_completed']:
				wds_01.interaction()
				ProgressManager.chapter_2_progress['is_WDS_01_completed'] = true
		wds_02:
			if not ProgressManager.chapter_2_progress['is_WDS_02_completed']:
				wds_02.interaction()
				ProgressManager.chapter_2_progress['is_WDS_02_completed'] = true
		wds_03:
			if not ProgressManager.chapter_2_progress['is_WDS_03_completed']:
				wds_03.interaction()
				ProgressManager.chapter_2_progress['is_WDS_03_completed'] = true
		wds_04:
			if not ProgressManager.chapter_2_progress['is_WDS_04_completed']:
				wds_04.interaction()
				ProgressManager.chapter_2_progress['is_WDS_04_completed'] = true
	if (ProgressManager.chapter_2_progress['is_WDS_01_completed']
	and ProgressManager.chapter_2_progress['is_WDS_02_completed']
	and ProgressManager.chapter_2_progress['is_WDS_03_completed']
	and ProgressManager.chapter_2_progress['is_WDS_04_completed']
	):
		ProgressManager.chapter_2_progress['is_wtr_ch02_completed'] = true
