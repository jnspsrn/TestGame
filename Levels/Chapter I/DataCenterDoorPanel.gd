extends "res://Objects/Ship/DoorPanel.gd"

signal data_center_door_unlocked

func _ready():
	call_deferred("set_panel")

func update_puzzle(update):
	puzzle_solved = update
	if puzzle_solved:
		print("Updated puzzle to: ", puzzle_solved)
		SaveAndLoad.save_puzzle(self, get_level())
		call_deferred("set_door")
		emit_signal("data_center_door_unlocked")
