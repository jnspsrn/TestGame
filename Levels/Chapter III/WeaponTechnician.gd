extends InteractableObject


func interaction():
	if not ProgressManager.chapter_3_progress['prompt_dialogue_38']:
		Utils.prompt_dialogue("ch03_story_dialogue_38.json")
		ProgressManager.chapter_3_progress['prompt_dialogue_38'] = true
	elif not ProgressManager.chapter_3_progress['prompt_dialogue_39'] and ProgressManager.chapter_3_progress['is_wtr_workbench_completed']:
		Utils.prompt_dialogue("ch03_story_dialogue_39.json")
		ProgressManager.chapter_3_progress['prompt_dialogue_39'] = true
