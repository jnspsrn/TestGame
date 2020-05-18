extends Area2D




func _on_ch02_story_dialogue_24_body_entered(body):
	if body == GameManager.Player:
		yield(Utils.prompt_dialogue("ch02_story_dialogue_24.json"), "completed")
		self.queue_free()
