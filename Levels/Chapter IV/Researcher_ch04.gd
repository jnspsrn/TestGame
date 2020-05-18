extends InteractableObject


func interaction():
	if not ProgressManager.chapter_4_progress['prompt_dialogue_55']:
		Utils.prompt_dialogue("ch04_story_dialogue_55.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_55'] = true
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_56'] and ProgressManager.chapter_4_progress['is_rl_ch04_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_56.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_56'] = true
