extends "res://Objects/Ship/Commander.gd"


func interaction():
	if not ProgressManager.chapter_4_progress['prompt_dialogue_57'] and ProgressManager.chapter_4_progress['is_rl_ch04_completed']:
		yield(Utils.prompt_dialogue("ch04_story_dialogue_57.json"), "completed")
		ProgressManager.chapter_4_progress['prompt_dialogue_57'] = true
		Utils.next_chapter("res://Levels/Chapter IV/CC_CH04_02.tscn", Vector2(590, 21))
