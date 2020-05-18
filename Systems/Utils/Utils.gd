extends Node

const DIALOGUE_DIRECTORY = "res://Systems/Dialogue/data/"

signal changed_chapter

func _ready():
	pass

func prompt_dialogue(path):
	var file = DIALOGUE_DIRECTORY + path
	var dialoguePrompt = load("res://Systems/Dialogue/DialoguePrompt.tscn").instance()
	dialoguePrompt.dialogue_file_path = file
	yield(dialoguePrompt.interact(), "completed")
	dialoguePrompt.queue_free()


func set_player_coordinates():
	GameManager.Player.position = Vector2(590, 21)

func set_current_level_puzzles():
	for puzzleObject in get_tree().get_nodes_in_group("PuzzleObject"):
		if puzzleObject.is_in_group("DoorPanel"):
			puzzleObject.puzzle_solved = true
			puzzleObject.interactable = false
			puzzleObject.call_deferred("set_door")

func next_chapter(level, playerPosition):
	GameManager.CurrentLevel.queue_free()
	var NewLevel = load(level)
	var newLevel = NewLevel.instance()
	get_node("/root/World").add_child(newLevel)
	GameManager.Player.position = playerPosition
	self.emit_signal("changed_chapter")
	SaveAndLoad.load_event_prompts()

