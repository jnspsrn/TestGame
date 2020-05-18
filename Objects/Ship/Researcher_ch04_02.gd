extends InteractableObject


func interaction():
	if not ProgressManager.chapter_4_progress['prompt_dialogue_63']:
		Utils.prompt_dialogue("ch04_story_dialogue_63.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_63'] = true
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_64'] and ProgressManager.chapter_4_progress['is_rl_ch04_02_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_64.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_64'] = true
