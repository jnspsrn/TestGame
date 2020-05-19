extends Puzzle
class_name CircuitElementPuzzle

var InstructionLabel = "Assign the correct\ndirection of the\nCurrent"
var Counter = 0.01
var x = 0

func _ready():
	while [x < 43]:
		yield(get_tree().create_timer(Counter), "timeout")
		$Sprite/InstructionLabel.text += InstructionLabel[x]
		x += 1
		if x == 43:
			x = 0
			break

