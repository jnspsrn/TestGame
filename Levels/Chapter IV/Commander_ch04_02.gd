extends StaticBody2D


func interaction():
	if not ProgressManager.chapter_4_progress['prompt_dialogue_61'] and ProgressManager.chapter_4_progress['is_wtr_ch04_completed']:
		Utils.prompt_dialogue("ch04_story_dialogue_61.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_61'] = true
		Utils.next_chapter("", Vector2(590, 21))
