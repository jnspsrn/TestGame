extends "res://Levels/Chapter III/Commander.gd"


func interaction():
	if not ProgressManager.chapter_3_progress['prompt_dialogue_44'] and ProgressManager.chapter_3_progress['is_a_workbench_completed']:
		Utils.prompt_dialogue("ch03_story_dialogue_44.json")
		ProgressManager.chapter_3_progress['prompt_dialogue_44'] = true
	elif not ProgressManager.chapter_3_progress['prompt_dialogue_46'] and ProgressManager.chapter_3_progress['is_ds_ch03_completed']:
		yield(Utils.prompt_dialogue("ch03_story_dialogue_46.json"), "completed")
		ProgressManager.chapter_3_progress['prompt_dialogue_46'] = true
		Utils.next_chapter("res://Levels/Chapter III/CC_CH03_03.tscn", Vector2(590, 21))
	elif not ProgressManager.chapter_3_progress['prompt_dialogue_53'] and ProgressManager.chapter_3_progress['is_rl_ch03_completed']:
		yield(Utils.prompt_dialogue("ch03_story_dialogue_53.json"), "completed")
		ProgressManager.chapter_3_progress['prompt_dialogue_53'] = true
		Utils.next_chapter("res://Levels/Chapter IV/CC_CH04.tscn", Vector2(590, 21))
