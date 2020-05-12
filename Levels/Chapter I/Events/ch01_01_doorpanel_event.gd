extends EventPrompt

onready var dialoguePrompt = $DialoguePrompt

func _on_evnt_01_body_entered(player):
	if player == GameManager.Player:
		GameManager.Player.movement_disabled = true
		yield(dialoguePrompt.interact(), "completed")
	GameManager.Player.movement_disabled = false
	self.queue_free()
