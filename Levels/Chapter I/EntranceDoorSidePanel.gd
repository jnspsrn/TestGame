extends "res://Objects/Ship/DoorPanel.gd"

signal entrance_door_unlocked

func update_puzzle(update):
	puzzle_solved = update
	if puzzle_solved:
		print("Updated puzzle to: ", puzzle_solved)
		SaveAndLoad.save_puzzle(self, get_level())
		call_deferred("set_door")
		emit_signal("entrance_door_unlocked")

