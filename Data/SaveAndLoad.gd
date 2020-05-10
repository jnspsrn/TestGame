extends Node

var is_loading = false
var SAVE_GAME_PATH = "user://game_data/game.save"
var SAVE_GAME_DIRECTORY = "user://game_data/"

func save_game():
	var to_be_saved_data = GameManager.save_data()
	var path = SAVE_GAME_PATH
	var directory = Directory.new()
	if not directory.dir_exists(SAVE_GAME_DIRECTORY):
		directory.make_dir_recursive(SAVE_GAME_DIRECTORY)
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_string(to_json(to_be_saved_data))
	file.close()
	

func load_game():
	print("Loading game")
	var to_be_updated = get_tree().get_nodes_in_group("MainInstances")
	var file = File.new()
	if not file.file_exists(SAVE_GAME_PATH):
		print("File does not exist!")
		return
	file.open(SAVE_GAME_PATH, File.READ)
	var loaded_data = parse_json(file.get_as_text())
	for node in to_be_updated:
		node.free()
	for keys in loaded_data.keys():
		if keys != "CurrentChapter" and keys != "GameProgress" and keys != "PuzzleData":
			var data = loaded_data[keys]
			var node = load(data['filename']).instance()
			get_node(data['parent']).add_child(node)
			var properties = data['properties']
			var position_x = 0
			var position_y = 0
			for property in properties.keys():
				if property == "position_x":
					position_x = properties[property]
				elif property == "position_y":
					position_y = properties[property]
				elif property == "current":
					node.set(property, properties[property])
				node.set(property, properties[property])
			node.set("position", Vector2(position_x, position_y))
		elif keys == "CurrentChapter":
			GameManager.CurrentChapter = loaded_data[keys]
		elif keys == "GameProgress":
			GameManager.CurrentChapter = loaded_data[keys]
		elif keys == "PuzzleData":
			GameManager.PuzzleData = loaded_data[keys]

func save_puzzle(object, id):
	if ProgressManager.is_new_game:
		ProgressManager.is_new_game = false
	if GameManager.PuzzleData != null and GameManager.PuzzleData.has(str(id)):
		GameManager.PuzzleData[str(id)].append(object.save_puzzle_data())
		return
	elif GameManager.PuzzleData != null:
		GameManager.PuzzleData[str(id)] = []
		GameManager.PuzzleData[str(id)].append(object.save_puzzle_data())
	elif GameManager.PuzzleData == null:
		print("PuzzleData is null!")
	print(GameManager.PuzzleData)

func load_puzzle(object, id):
	if GameManager.PuzzleData != null and GameManager.PuzzleData.has(str(id)):
		for node_data in GameManager.PuzzleData[str(id)]:
			if node_data['filename'] == object.filename and node_data['parent'] == object.get_parent().get_path():
				object.set('puzzle_solved', node_data['puzzle_solved'])
