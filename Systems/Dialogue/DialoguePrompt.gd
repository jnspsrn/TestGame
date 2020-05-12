extends Node
class_name DialoguePrompt

export (String, FILE, "*.json") var dialogue_file_path: String
#signal dialogue_loaded(data)


func interact():
	GameManager.Player.movement_disabled = true
	var dialogue: Dictionary = load_dialogue(dialogue_file_path)
	yield(GameManager.UI.play_dialogue(dialogue), "completed")
	GameManager.Player.movement_disabled = false


func load_dialogue(file_path) -> Dictionary:
	# Parses a JSON file and returns it as a dictionary
	var file = File.new()
	assert(file.file_exists(file_path))
	file.open(file_path, file.READ)
	var dialogue = parse_json(file.get_as_text())
	assert(dialogue.size() > 0)
	return dialogue
