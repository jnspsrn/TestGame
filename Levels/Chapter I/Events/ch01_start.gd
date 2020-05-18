extends EventPrompt

func _on_StartDialogue_body_entered(player):
	if player == GameManager.Player:
		Utils.prompt_dialogue("ch01_story_dialogue_01.json")
	self.queue_free()
