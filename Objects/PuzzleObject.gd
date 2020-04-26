extends InteractableObject
class_name PuzzleObject

export(String, FILE, "*.tscn") var puzzlePath = ""

var is_window_open = false
var root

func interaction():
	root = get_tree().get_root().get_node(".")
	if is_window_open == false:
		is_window_open = true
		var PuzzlePath = load(puzzlePath)
		var puzzle = PuzzlePath.instance()
		var Window = load("res://Systems/Window System/Window.tscn")
		var window = Window.instance()
		root.add_child(window)
		MainInstances.Player.movement_disabled = true
		root.get_node("Window").add_child(puzzle)
	elif is_window_open == true:
		is_window_open = false
		call_deferred("close_window")
		MainInstances.Player.movement_disabled = false

func close_window():
	root.get_node("Window").queue_free()
