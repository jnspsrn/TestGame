extends Puzzle

export (bool) var solved
var doorPanel
var checker = 0

func _ready():
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"


func _check():
	if checker == 2:
		$WarningLabel.text = "You are correct!"
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		pass

func _on_Current_text_entered(new_text):
	if $Current.text == "Currents" or $Current.text == "currents":
		$Current.visible = false 
		checker += 1
		_check()
	else:
		$WarningLabel.text = "Try Again!"

func _on_Voltage_text_entered(new_text):
	if $Voltage.text == "Voltages" or $Current.text == "voltages":
		$Voltage.visible = false 
		checker += 1
		_check()
	else:
		$WarningLabel.text = "Try Again!"
