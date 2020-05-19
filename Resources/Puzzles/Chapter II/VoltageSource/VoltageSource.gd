extends Puzzle

export (bool) var solved
var doorPanel
var VoltageValue = 0

func _ready():
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"


func _on_VoltageUp_pressed():
	VoltageValue += 1
	$VoltageValue.text = str(VoltageValue) + "V"


func _on_VoltageDown_pressed():
	VoltageValue -= 1
	$VoltageValue.text = str(VoltageValue) + "V"


func _on_Submit_pressed():
	if VoltageValue == -2:
		$WarningLabel.text = "You Are Correct!"
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		$WarningLabel.text = "Try Again!"
	
