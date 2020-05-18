extends "res://Levels/Level.gd"

onready var doorPanel = $DoorPanel

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	if not ProgressManager.chapter_3_progress['prompt_dialogue_48']:
		Utils.call_deferred("prompt_dialogue", "ch03_story_dialogue_48.json")
		ProgressManager.chapter_3_progress['prompt_dialogue_48'] = true
	doorPanel.connect("is_solved", self, "_on_is_solved")


func _on_is_solved(object):
	if not ProgressManager.chapter_3_progress['is_lee_ch03_completed']:
		object.interaction()
		ProgressManager.chapter_3_progress['is_lee_ch03_completed'] = true
		Utils.next_chapter("res://Levels/Chapter III/CC_CH03_02.tscn", Vector2(590, 21))
		yield(Utils.prompt_dialogue("ch03_story_dialogue_50.json"), "completed")
