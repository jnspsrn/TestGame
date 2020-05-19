extends Puzzle

export (bool) var solved
var doorPanel
var Resistor1Value = 0
var Resistor2Value = 0
var CurrentValue


func _ready():
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"

func _get_current():
	var Req = (Resistor1Value+Resistor2Value)/Resistor1Value
	CurrentValue = float(Req)*8
	$CurrentValue.text = str(CurrentValue) + "A"

func _on_Res1Up_pressed():
	Resistor1Value += 1.0
	$Resistor1.text = str(Resistor1Value) + "Ω"
	_get_current()
func _on_Res1Down_pressed():
	Resistor1Value -= 1.0
	$Resistor1.text = str(Resistor1Value) + "Ω"
	_get_current()

func _on_Res2Up_pressed():
	Resistor2Value += 1.0
	$Resistor2.text = str(Resistor2Value) + "Ω"
	_get_current()
func _on_Res2Down_pressed():
	Resistor2Value -= 1.0
	$Resistor2.text = str(Resistor2Value) + "Ω"
	_get_current()


func _on_Submit_pressed():
	if CurrentValue == 10:
		$WarningLabel.text = "You Are Correct!"
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		$WarningLabel.text = "Try Again!"
