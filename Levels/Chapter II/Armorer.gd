extends InteractableObject


func interaction():
	if not ProgressManager.chapter_2_progress['prompt_dialogue_27']:
		Utils.prompt_dialogue("ch02_story_dialogue_27.json")
		ProgressManager.chapter_2_progress['prompt_dialogue_27'] = true
	elif not ProgressManager.chapter_2_progress['prompt_dialogue_29'] and ProgressManager.chapter_2_progress['is_a_ch02_completed']:
		Utils.prompt_dialogue("ch02_story_dialogue_29.json")
		ProgressManager.chapter_2_progress['prompt_dialogue_29'] = true
