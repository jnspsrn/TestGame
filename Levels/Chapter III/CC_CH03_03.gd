extends "res://Levels/Chapter III/CC_CH03_02.gd"


func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	if not ProgressManager.chapter_3_progress['prompt_dialogue_47']:
		Utils.call_deferred("prompt_dialogue", "ch03_story_dialogue_47.json")
		ProgressManager.chapter_3_progress['prompt_dialogue_47'] = true
