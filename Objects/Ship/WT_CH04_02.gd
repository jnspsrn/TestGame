extends InteractableObject


func interaction():
	if not ProgressManager.chapter_4_progress['prompt_dialogue_66']:
		Utils.prompt_dialogue("ch04_story_dialogue_66.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_66'] = true
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_67'] and ProgressManager.chapter_4_progress['is_wtr_ch04_02_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_67.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_67'] = true
