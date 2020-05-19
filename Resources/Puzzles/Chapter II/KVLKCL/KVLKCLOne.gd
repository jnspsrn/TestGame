extends WeaponPuzzles


var InstructionLabel = "Complete the statement:"
var InstructionOne = "A ____ is a point where two or more circuit\nelements meet>"
var InstructionTwo = "Kirchhoff's current law is the algebraic sum\nof all the ________ at any node in a circuit\nequals zero>"
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"
var x = 0
var y = 0
var Counter = 0.01

func _ready():
	while [x < 23]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionLabel[x]
		x += 1
		if x == 23:
			x = 0
			break
	yield(get_tree().create_timer(0.5), "timeout")
	while [x < 58]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionOne.text += InstructionOne[x]
		x += 1
		if x == 58:
			$InstructionOne/Node.grab_focus()
			x = 0
			break



func _on_Node_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "Node" or new_text == "node":
		$InstructionOne.text = "A node is a point where two or more circuit\nelements meet."
		$InstructionOne/Node.visible = false
		while [x < 102]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionTwo.text += InstructionTwo[x]
			x += 1
			if x == 102:
				$InstructionTwo/Current.grab_focus()
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
func _on_Current_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "Current" or new_text == "current" or new_text == "currents" or new_text == "Currents":
		$InstructionTwo.text = "Kirchhoff's current law is the algebraic sum\nof all the currents at any node in a circuit\nequals zero."
		$InstructionTwo/Current.visible = false
		$InstructionTwo/Current.grab_focus()
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
