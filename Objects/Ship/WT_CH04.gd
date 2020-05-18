extends InteractableObject


func interaction():
	if not ProgressManager.chapter_4_progress['prompt_dialogue_59']:
		Utils.prompt_dialogue("ch04_story_dialogue_59.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_59'] = true
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_60'] and ProgressManager.chapter_4_progress['is_wtr_ch04_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_60.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_60'] = true
