extends WeaponPuzzles

var InstructionLabel = "Complete the statement:"
var InstructionOne = "A ____ is a closed path returning to the\nstarting node without passing through any\nnode more than once>"
var InstructionTwo = "Kirchhoffs voltage law is the algebraic sum\nof all the ________ around any closed path\nin a circuit equals zero>"
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"
var x = 0
var y = 0
var Counter = 0.01
var puzzleObject
 

func _ready():
	while [x < 23]:
		puzzleObject = get_parent()
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionLabel[x]
		x += 1
		if x == 23:
			x = 0
			break
	yield(get_tree().create_timer(0.5), "timeout")
	while [x < 103]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionOne.text += InstructionOne[x]
		x += 1
		if x == 103:
			x = 0
			$InstructionOne/Loop.grab_focus()
			break



func _on_Loop_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "Loop" or new_text == "loop":
		$InstructionOne.text = "A loop is a closed path returning to the\nstarting node without passing through any\nnode more than once."
		$InstructionOne/Loop.visible = false
		while [x < 112]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionTwo.text += InstructionTwo[x]
			x += 1
			if x == 112:
				x = 0
				$InstructionTwo/Voltage.grab_focus()
				break
	else:
		while [y < 6]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 6:
				y = 0
				break
func _on_Voltage_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "Voltage" or new_text == "voltages" or new_text == "voltage" or new_text == "Voltages":
		$InstructionTwo.text = "Kirchhoffs voltage law is the algebraic sum\nof all the voltages around any closed path\nin a circuit equals zero."
		$InstructionTwo/Voltage.visible = false
		puzzleObject.update_puzzle(true)
		while [x < 8]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelCorrect[x]
			x += 1
			if x == 8:
				x = 0
				break
	else:
		while [y < 6]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 6:
				y = 0
				break
