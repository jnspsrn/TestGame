extends EventPrompt

onready var dialoguePrompt = $DialoguePrompt

func _on_StartDialogue_body_entered(player):
	if player == GameManager.Player:
		yield(dialoguePrompt.interact(), "completed")
	self.queue_free()
