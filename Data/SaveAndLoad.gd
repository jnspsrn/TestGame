extends Node

var is_loading = false
var SAVE_GAME_PATH = "user://game_data/game.save"
var SAVE_GAME_DIRECTORY = "user://game_data/"
var timer

func save_game():
	save_event_prompts()
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
	file.close()
	for node in to_be_updated:
		node.free()
	for keys in loaded_data.keys():
		if keys != "CurrentChapter" and keys != "GameProgress" and keys != "PuzzleData" and keys != "EventPrompts":
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
		elif keys == "EventPrompts":
			GameManager.EventPrompts = loaded_data[keys]
		elif keys == "GameProgress":
			ProgressManager.progress = loaded_data[keys]
			ProgressManager.chapter_1_progress = ProgressManager.progress["Chapter 1"]
		elif keys == "PuzzleData":
			GameManager.PuzzleData = loaded_data[keys]
	load_event_prompts()

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

func load_puzzle(object, id):
	if GameManager.PuzzleData != null and GameManager.PuzzleData.has(str(id)):
		for node_data in GameManager.PuzzleData[str(id)]:
			if node_data['filename'] == object.filename and node_data['parent'] == object.get_parent().get_path():
				object.set('puzzle_solved', node_data['puzzle_solved'])
				object.interactable = node_data['interactable']

func save_event_prompts():
	var save = {}
	var level
	for events in get_tree().get_nodes_in_group("EventPrompt"):
		var data = events.save_event()
		level = data["level"]
		if save.has(level):
			save[level].append(data)
			continue
		save[level] = [data]
	if not save.empty():
		if GameManager.EventPrompts.has(level):
			GameManager.EventPrompts[str(level)] = save[level]
		elif not GameManager.EventPrompts.has(level):
			GameManager.EventPrompts[str(level)] = save[level]
	elif save.empty() and GameManager.EventPrompts.has(str(GameManager.CurrentLevel.name)):
		GameManager.EventPrompts[str(GameManager.CurrentLevel.name)].clear()

func load_event_prompts():
	for nodes in get_tree().get_nodes_in_group("EventPrompt"):
		nodes.queue_free()
	if GameManager.EventPrompts.has(str(GameManager.CurrentLevel.name)):
		if GameManager.EventPrompts[str(GameManager.CurrentLevel.name)] != null:
			for events in GameManager.EventPrompts[str(GameManager.CurrentLevel.name)]:
				var node = load(events['filename']).instance()
				get_node(events['parent']).add_child(node)
				var properties = events["properties"]
				for property in properties:
					node.set(property, properties[property])

func save_prompt_delay():
	timer = Timer.new()
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_one_shot(true)
	timer.set_wait_time(0.5)
	add_child(timer)
	timer.start()
	
func _on_Timer_timeout():
	save_event_prompts()
	call_deferred("timer.free")
