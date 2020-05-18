extends InteractableObject


func interaction():
	if not ProgressManager.chapter_6_progress['prompt_dialogue_80']:
		Utils.prompt_dialogue("ch06_story_dialogue_80.json")
		ProgressManager.chapter_6_progress['prompt_dialogue_80'] = true
	elif not ProgressManager.chapter_6_progress['prompt_dialogue_81'] and ProgressManager.chapter_6_progress['is_rl_ch06_completed']:
		Utils.prompt_dialogue("ch06_story_dialogue_81.json")
		ProgressManager.chapter_6_progress['prompt_dialogue_81'] = true
