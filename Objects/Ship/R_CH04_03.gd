extends InteractableObject


func interaction():
	if not ProgressManager.chapter_4_progress['prompt_dialogue_72']:
		Utils.prompt_dialogue("ch04_story_dialogue_72.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_72'] = true
	elif not ProgressManager.chapter_4_progress['prompt_dialogue_73'] and ProgressManager.chapter_4_progress['is_rl_ch04_02_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_73.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_73'] = true
