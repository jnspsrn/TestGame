extends Puzzle

var puzzleObject

func _ready():
	puzzleObject = get_parent()
	pass


func _on_V1_text_entered(new_text):
	if new_text == "32":
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You are Correct!"
		$InstructionLabel.text = "Now v1 is our Thevenin Voltage, Vth"
	else:
		$WarningLabel.text = "Try Again!"
