extends Puzzle

export (bool) var solved
var doorPanel
var VoltageValue = 0
var InstructionLabel = "Get the voltage Around Vo."
var x = 0
var y = 0
var Counter = 0
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"

func _ready():
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"
	while [x < 26]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionLabel[x]
		x += 1
		if x == 26:
			break

func _on_VoltageUp_pressed():
	VoltageValue += 1
	$VoltageValue.text = str(VoltageValue) + "V"


func _on_VoltageDown_pressed():
	VoltageValue -= 1
	$VoltageValue.text = str(VoltageValue) + "V"



func _on_Submit_pressed():
	if VoltageValue == 20:
		$WarningLabel.text = "You are Correct!"
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		$WarningLabel.text = "Try Again!"
