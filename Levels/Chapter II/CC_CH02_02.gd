extends "res://Levels/Chapter II/CC_CH02.gd"


func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	if not ProgressManager.chapter_2_progress['prompt_dialogue_33']:
		Utils.call_deferred("prompt_dialogue", "ch02_story_dialogue_33.json")
		ProgressManager.chapter_2_progress['prompt_dialogue_33'] = true
