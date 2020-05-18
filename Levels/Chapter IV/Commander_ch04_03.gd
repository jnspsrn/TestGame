extends "res://Levels/Chapter IV/Commander_ch04_02.gd"


func interaction():
	if not ProgressManager.chapter_4_progress['prompt_dialogue_65'] and ProgressManager.chapter_4_progress['is_rl_ch04_02_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_65.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_65'] = true
	
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_68'] and ProgressManager.chapter_4_progress['is_wtr_ch04_02_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_68.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_68'] = true
	
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_71'] and ProgressManager.chapter_4_progress['is_a_ch04_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_71.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_71'] = true
	
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_74'] and ProgressManager.chapter_4_progress['is_rl_ch04_03_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_74.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_74'] = true
	
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_77'] and ProgressManager.chapter_4_progress['is_wtr_ch04_03_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_77.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_77'] = true
	
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_78'] and ProgressManager.chapter_4_progress['is_er_ch04_completed']:
		yield(Utils.prompt_dialogue("ch04_story_dialogue_78.json"), "completed")
		ProgressManager.chapter_4_progress['prompt_dialogue_78'] = true
		Utils.next_chapter("res://Levels/Chapter VI/CC_CH06.tscn", Vector2(590, 21))
