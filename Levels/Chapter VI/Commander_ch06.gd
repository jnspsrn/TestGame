extends "res://Objects/Ship/Commander.gd"


func interaction():
	if not ProgressManager.chapter_6_progress['prompt_dialogue_82']:
		Utils.prompt_dialogue("ch06_story_dialogue_82.json")
		ProgressManager.chapter_6_progress['prompt_dialogue_82'] = true
