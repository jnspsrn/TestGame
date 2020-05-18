extends "res://Levels/Level.gd"


func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	if not ProgressManager.chapter_2_progress['prompt_dialogue_24']:
		Utils.call_deferred("set_player_coordinates", 590, 21)
		Utils.call_deferred("set_current_level_puzzles")
		Utils.call_deferred("prompt_dialogue", "ch02_story_dialogue_24.json")
		ProgressManager.chapter_2_progress['prompt_dialogue_24'] = true
