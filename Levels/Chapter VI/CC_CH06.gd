extends "res://Levels/Level.gd"


func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	Utils.call_deferred("set_current_level_puzzles")
	if not ProgressManager.chapter_6_progress['prompt_dialogue_79']:
		Utils.call_deferred("prompt_dialogue", "ch06_story_dialogue_79.json")
		ProgressManager.chapter_6_progress['prompt_dialogue_79'] = true
