extends "res://Levels/Chapter II/Commander.gd"


func interaction():
	if not ProgressManager.chapter_2_progress['prompt_dialogue_36'] and ProgressManager.chapter_2_progress['is_broken_core_completed']:
		yield(Utils.prompt_dialogue("ch02_story_dialogue_36.json"), "completed")
		ProgressManager.chapter_2_progress['prompt_dialogue_36'] = true
		Utils.next_chapter("res://Levels/Chapter III/CC_CH03.tscn", Vector2(590, 21))
