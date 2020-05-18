extends InteractableObject


func interaction():
	if not ProgressManager.chapter_4_progress['prompt_dialogue_75']:
		Utils.prompt_dialogue("ch04_story_dialogue_75.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_75'] = true
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_76'] and ProgressManager.chapter_4_progress['is_wtr_ch04_03_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_76.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_76'] = true
