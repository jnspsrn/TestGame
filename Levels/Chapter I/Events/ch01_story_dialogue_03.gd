extends "res://Levels/Chapter I/Events/ch01_01_doorpanel_event.gd"


func _on_ch01_story_dialogue_03_body_entered(body):
	if body == GameManager.Player:
		Utils.prompt_dialogue("ch01_story_dialogue_03.json")
	self.queue_free()
