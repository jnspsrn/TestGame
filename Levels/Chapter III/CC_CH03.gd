extends "res://Levels/Level.gd"

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	Utils.call_deferred("set_current_level_puzzles")
	if not ProgressManager.chapter_3_progress['prompt_dialogue_37']:
		Utils.call_deferred("prompt_dialogue", "ch03_story_dialogue_37.json")
		ProgressManager.chapter_3_progress['prompt_dialogue_37'] = true
