extends InteractableObject
class_name PuzzleObject

export(String, FILE, "*.tscn") var puzzlePath = ""
export(bool) var puzzle_solved

var is_puzzle_open = false
var puzzle

signal closed_puzzle
signal is_solved(object)

func _ready():
	if ProgressManager.is_new_game:
		set_to_default()
	elif GameManager.state != GameManager.GAME_STATE.LOADING:
		SaveAndLoad.load_puzzle(self, get_level())

func update_puzzle(update):
	puzzle_solved = update
	if puzzle_solved:
		print("Updated puzzle to: ", puzzle_solved)
		SaveAndLoad.save_puzzle(self, get_level())
		emit_signal("is_solved", self)

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
		emit_signal("closed_puzzle")
		set_interactable()

func save_puzzle_data():
	return { 
		"filename" : filename,
		"parent" : get_parent().get_path(),
		"puzzle_solved" : puzzle_solved,
		"interactable" : interactable
	}

func set_to_default():
	puzzle_solved = false
	interactable = true

func set_load_puzzle_data():
	SaveAndLoad.load_puzzle(self, get_level())

func get_level():
	return GameManager.CurrentLevel.name

func set_interactable():
	if puzzle_solved:
		interactable = false
		SaveAndLoad.save_puzzle(self, get_level())
