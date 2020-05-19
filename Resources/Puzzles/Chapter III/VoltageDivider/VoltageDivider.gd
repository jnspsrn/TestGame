extends Puzzle

export (bool) var solved
var VoltageValue = 0
var InstructionLabel = "Get the voltage Around Vo."
var x = 0
var y = 0
var Counter = 0
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"
var puzzleObject
 

func _ready():
	puzzleObject = get_parent()
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
	$WarningLabel.text = ""
	if VoltageValue == 80:
		puzzleObject.update_puzzle(true)
		while [y < 8]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelCorrect[y]
			y += 1
			if y == 8:
				y = 0
				break
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		while [y < 6]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 6:
				y = 0
				break

