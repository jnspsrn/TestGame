extends InteractableObject


func interaction():
	if not ProgressManager.chapter_2_progress['prompt_dialogue_25']:
		Utils.prompt_dialogue("ch02_story_dialogue_25.json")
		ProgressManager.chapter_2_progress['prompt_dialogue_25'] = true
	elif not ProgressManager.chapter_2_progress['prompt_dialogue_26'] and ProgressManager.chapter_2_progress['is_rl_ch01_workbench_completed']:
		Utils.prompt_dialogue("ch02_story_dialogue_26.json")
		ProgressManager.chapter_2_progress['prompt_dialogue_26'] = true
