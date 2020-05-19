extends Puzzle

func _ready():
	pass


func _on_V1_text_entered(new_text):
	if new_text == "32":
		$WarningLabel.text = "You are Correct!"
		$InstructionLabel.text = "Now v1 is our Thevenin Voltage, Vth"
	else:
		$WarningLabel.text = "Try Again!"
