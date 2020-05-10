extends Node

var is_new_game : bool
var progress = {
	"Chapter 1" : false,
	"Chapter 2" : false,
	"Chapter 3" : false,
	"Chapter 4" : false,
	"Chapter 6" : false,
}

var chapter_1_conditions

func _ready():
	load_conditions()
		
func create_needed_progress():
	var path = "user://game_data/conditions/chapter_1.save"
	var directory = Directory.new()
	if not directory.dir_exists("user://game_data/conditions/"):
		directory.make_dir_recursive("user://game_data/conditions/")
	var file = File.new()
	file.open(path, File.WRITE)
	file.close()

func load_conditions():
	var path = "user://game_data/conditions/chapter_1.save"
	var file = File.new() 
	if not file.file_exists(path):
		print("File does not exist: %s" % path)
		return
	file.open(path, File.READ)
	var needed_progress = parse_json(file.get_as_text())
	file.close()
	chapter_1_conditions = needed_progress

func compare_progress():
#	var file = File.new()
#	file.open("user://puzzle_data/save.game", File.READ)
#	var current_data = parse_json(file.get_as_text())
#	file.close()
	var current_data = GameManager.PuzzleData
	var key_size = chapter_1_conditions.keys().size()
	var needed_doors = 0
	for needed_key in chapter_1_conditions.keys():
		if current_data.keys().has(needed_key):
			var needed_array = chapter_1_conditions[needed_key]
			var current_array = current_data[needed_key]
			var c_size =  needed_array.size()
			for needed_index in needed_array.size():
				for current_index in current_array.size():
					if current_array[current_index].hash() == needed_array[needed_index].hash():
						c_size -= 1
			if c_size == 0:
				key_size -= 1
			else:
				needed_doors = needed_doors + c_size
	if key_size == 0:
		print("LEVEL COMPLETED")
	print("LEVEL INCOMPLETE: Need ",needed_doors, " more doors to complete mission")
	
func set_progress_to_default():
	progress = {
	"Chapter 1" : false,
	"Chapter 2" : false,
	"Chapter 3" : false,
	"Chapter 4" : false,
	"Chapter 6" : false,
}
	GameManager.GameProgress = progress
	GameManager.PuzzleData = {}
	GameManager.CurrentChapter = "Chapter 1"
	
