extends "res://Objects/Ship/Commander.gd"


func interaction():
	if (not ProgressManager.chapter_2_progress['prompt_dialogue_32']
	and ProgressManager.chapter_2_progress['prompt_dialogue_31']):
		yield(Utils.prompt_dialogue("ch02_story_dialogue_32.json"), "completed")
		ProgressManager.chapter_2_progress['prompt_dialogue_32'] = true
		Utils.next_chapter("res://Levels/Chapter II/CC_CH02_02.tscn", Vector2(590, 21))
