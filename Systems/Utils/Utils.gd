extends Node

const DIALOGUE_DIRECTORY = "res://Systems/Dialogue/data/"

func _ready():
	pass

func prompt_dialogue(path):
	var file = DIALOGUE_DIRECTORY + path
	var dialoguePrompt = load("res://Systems/Dialogue/DialoguePrompt.tscn").instance()
	dialoguePrompt.dialogue_file_path = file
	yield(dialoguePrompt.interact(), "completed")
	dialoguePrompt.queue_free()
