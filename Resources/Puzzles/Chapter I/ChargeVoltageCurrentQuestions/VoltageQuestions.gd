extends Puzzle

var Energy = false
var Charge = false
var InstructionOne = ">The difference in electric potential between two points is >"
var InstructionTwo = ">Voltage is ______ per ______ (V = dw/dq)>"
var WarningLabelWrong = "Error, Try Again!"
var WarningLabelCorrect = "You Are Correct!"
var Counter = 0.01
var x = 0
var y = 0
var z = 0
var puzzleObject
 

func _ready():
	$InstructionLabel/Voltage.grab_focus()
	puzzleObject = get_parent()
	while [x < 61]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionOne[x]
		x += 1
		if x == 61:
			break

func _on_Voltage_text_entered(new_text):
	if new_text == "voltage" or new_text == "Voltage":
		$InstructionLabel2.visible = true
		$InstructionLabel2/Energy.grab_focus()
		$InstructionLabel/Voltage.visible = false
		$WarningLabel.text = ""
		while [y < 42]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel2.text += InstructionTwo[y]
			y += 1
			if y == 42:
				y = 0
				break
	else:
		while [y < 17]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 17:
				y = 0
				break

func _on_Energy_text_entered(new_text):
	if new_text == "energy" or new_text == "work":
		Energy = true
		$InstructionLabel2/Charge.grab_focus()
		$InstructionLabel2/Energy.visible = false
		$WarningLabel.text = ""
	else:
		while [y < 17]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 17:
				y = 0
				break
func _on_Charge_text_entered(new_text):
	if new_text == "charge" or new_text == "unit charge":
		Charge = true
		$WarningLabel.text = ""
		puzzleObject.update_puzzle(true)
		while [y < 16]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelCorrect[y]
			y += 1
			if y == 16:
				y = 0
				break
	else:
		while [y < 17]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 17:
				y = 0
				break

