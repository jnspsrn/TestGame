extends PuzzleObject


func _ready():
	call_deferred("set_panel")

func update_puzzle(update):
	puzzle_solved = update
	if puzzle_solved:
		print("Updated puzzle to: ", puzzle_solved)
		SaveAndLoad.save_puzzle(self, get_level())
		emit_signal("is_solved", self)
		call_deferred("set_door")

func set_door():
	var door = get_parent()
	if puzzle_solved:
		door.unlock_door()
	else:
		door.lock_door()

func set_panel():
	if ProgressManager.is_new_game:
		set_to_default()
	else:
		call_deferred("set_load_puzzle_data")

func set_to_default():
	puzzle_solved = false
	interactable = true
	call_deferred("set_door")

func set_load_puzzle_data():
	SaveAndLoad.load_puzzle(self, get_level())
	call_deferred("set_door")
