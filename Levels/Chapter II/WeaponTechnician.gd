extends InteractableObject


func interaction():
	if not ProgressManager.chapter_2_progress['prompt_dialogue_30']:
		Utils.prompt_dialogue("ch02_story_dialogue_30.json")
		ProgressManager.chapter_2_progress['prompt_dialogue_30'] = true
	elif not ProgressManager.chapter_2_progress['prompt_dialogue_31'] and ProgressManager.chapter_2_progress['is_wtr_ch02_completed']:
		Utils.prompt_dialogue("ch02_story_dialogue_31.json")
		ProgressManager.chapter_2_progress['prompt_dialogue_31'] = true
