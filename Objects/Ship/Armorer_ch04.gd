extends InteractableObject


func interaction():
	if not ProgressManager.chapter_4_progress['prompt_dialogue_69']:
		Utils.prompt_dialogue("ch04_story_dialogue_69.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_69'] = true
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_70'] and ProgressManager.chapter_4_progress['is_a_ch04_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_70.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_70'] = true
