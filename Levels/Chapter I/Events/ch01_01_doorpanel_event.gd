extends EventPrompt

func _on_evnt_01_body_entered(player):
	if player == GameManager.Player:
		Utils.prompt_dialogue("ch01_story_dialogue_02.json")
	self.queue_free()
