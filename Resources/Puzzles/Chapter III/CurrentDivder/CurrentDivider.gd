extends Puzzle

export (bool) var solved
var Resistor1Value = 0
var Resistor2Value = 0
var CurrentValue
var InstructionLabel = "Adjust the value of the Resistors to\nget the correct value of the Current\nSource"
var x = 0
var y = 0
var Counter = 0
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"
var Parallel = 0
var puzzleObject


func _ready():
	puzzleObject = get_parent()
	while [x < 80]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionLabel[x]
		x += 1
		if x == 80:
			x = 0
			break
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
	$WarningLabel.text = ""
	if CurrentValue == 10:
		puzzleObject.update_puzzle(true)
		while [y < 8]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelCorrect[y]
			y += 1
			if y == 8:
				y = 0
				break
	else:
		while [y < 6]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 6:
				y = 0
				break
