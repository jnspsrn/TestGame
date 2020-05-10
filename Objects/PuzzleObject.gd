extends InteractableObject
class_name PuzzleObject

export(String, FILE, "*.tscn") var puzzlePath = ""
export(bool) var puzzle_solved

var is_puzzle_open = false
var puzzle

func _ready():
	if ProgressManager.is_new_game:
		set_to_default()
	elif GameManager.state != GameManager.GAME_STATE.LOADING:
		SaveAndLoad.load_puzzle(self, get_level())

func interaction():
	if is_puzzle_open == false:
		is_puzzle_open = true
		var PuzzlePath = load(puzzlePath)
		puzzle = PuzzlePath.instance()
		self.add_child(puzzle)
		GameManager.Player.movement_disabled = true
		GameManager.WorldCamera.current = false
		puzzle.puzzleCamera.current = true
	elif is_puzzle_open == true:
		is_puzzle_open = false
		GameManager.Player.movement_disabled = false
		GameManager.WorldCamera.current = true
		puzzle.queue_free()

func save_puzzle_data():
	return { 
		"filename" : filename,
		"parent" : get_parent().get_path(),
		"puzzle_solved" : puzzle_solved
	}

func set_to_default():
	puzzle_solved = false

func set_load_puzzle_data():
	SaveAndLoad.load_puzzle(self, get_level())

func get_level():
	return GameManager.CurrentLevel.name
