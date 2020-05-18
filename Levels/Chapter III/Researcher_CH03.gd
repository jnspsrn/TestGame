extends InteractableObject


func interaction():
	if not ProgressManager.chapter_3_progress['prompt_dialogue_51']:
		Utils.prompt_dialogue("ch03_story_dialogue_51.json")
		ProgressManager.chapter_3_progress['prompt_dialogue_51'] = true
	elif not ProgressManager.chapter_3_progress['prompt_dialogue_52'] and ProgressManager.chapter_3_progress['is_rl_ch03_completed']:
		Utils.prompt_dialogue("ch03_story_dialogue_52.json")
		ProgressManager.chapter_3_progress['prompt_dialogue_52'] = true
