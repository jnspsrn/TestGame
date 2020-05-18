extends InteractableObject


func interaction():
	if not ProgressManager.chapter_3_progress['prompt_dialogue_42']:
		Utils.prompt_dialogue("ch03_story_dialogue_42.json")
		ProgressManager.chapter_3_progress['prompt_dialogue_42'] = true
	elif not ProgressManager.chapter_3_progress['prompt_dialogue_43'] and ProgressManager.chapter_3_progress['is_a_workbench_completed']:
		Utils.prompt_dialogue("ch03_story_dialogue_43.json")
		ProgressManager.chapter_3_progress['prompt_dialogue_43'] = true
