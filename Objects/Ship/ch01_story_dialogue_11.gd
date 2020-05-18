extends EventPrompt

func _on_ch01_story_dialogue_11_body_entered(body):
	if body == GameManager.Player:
		Utils.prompt_dialogue("ch01_story_dialogue_11.json")
		self.queue_free()
