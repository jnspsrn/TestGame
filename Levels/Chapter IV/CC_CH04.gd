extends "res://Levels/Level.gd"


func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	Utils.call_deferred("set_current_level_puzzles")
	if not ProgressManager.chapter_4_progress['prompt_dialogue_54']:
		Utils.call_deferred("prompt_dialogue", "ch04_story_dialogue_54.json")
		ProgressManager.chapter_4_progress['prompt_dialogue_54'] = true
