extends "res://Objects/Ship/Commander.gd"


func interaction():
	if not ProgressManager.chapter_1_progress['is_RR_completion_reported']:
		Utils.prompt_dialogue("ch01_story_dialogue_18.json")
		ProgressManager.chapter_1_progress['is_RR_completion_reported'] = true
	elif not ProgressManager.chapter_1_progress['is_power_reported'] and ProgressManager.chapter_1_progress['is_RR_completion_reported']:
		Utils.prompt_dialogue("ch01_story_dialogue_21.json")
		ProgressManager.chapter_1_progress['is_power_reported'] = true
