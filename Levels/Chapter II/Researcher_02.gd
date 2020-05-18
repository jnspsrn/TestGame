extends InteractableObject


func interaction():
	if not ProgressManager.chapter_2_progress['prompt_dialogue_34']:
		Utils.prompt_dialogue("ch02_story_dialogue_34.json")
		ProgressManager.chapter_2_progress['prompt_dialogue_34'] = true
	elif not ProgressManager.chapter_2_progress['prompt_dialogue_35'] and ProgressManager.chapter_2_progress['is_broken_core_completed']:
		Utils.prompt_dialogue("ch02_story_dialogue_35.json")
		ProgressManager.chapter_2_progress['prompt_dialogue_35'] = true
