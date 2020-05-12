extends Node
class_name Puzzle

onready var puzzleCamera = $PuzzleCamera

var parent

func _ready():
	parent = get_parent()
	parent.connect("closed_puzzle", self, "_on_Puzzle_Closed")

func _on_Puzzle_Closed():
	self.queue_free()
