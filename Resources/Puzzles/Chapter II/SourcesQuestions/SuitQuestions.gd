extends Puzzle
class_name SuitPuzzle

var InstructionLabel = "Identify if circuit is valid or invalid"
var Counter = 0.01
var x = 0


func _ready():
	while [x < 39]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionLabel[x]
		x += 1
		if x == 39:
			break
