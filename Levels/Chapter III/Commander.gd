extends "res://Objects/Ship/Commander.gd"



func interaction():
	if not ProgressManager.chapter_3_progress['prompt_dialogue_40'] and ProgressManager.chapter_3_progress['is_wtr_workbench_completed']:
		yield(Utils.prompt_dialogue("ch03_story_dialogue_40.json"), "completed")
		ProgressManager.chapter_3_progress['prompt_dialogue_40'] = true
		Utils.next_chapter("res://Levels/Chapter III/CC_CH03_02.tscn", Vector2(590,21))
