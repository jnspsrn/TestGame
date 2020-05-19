extends Puzzle

var InstructionOne = "Connect the ammeter to the circuit."
var InstructionTwo = "What is the Correct Measurement?"
var WarningLabelCorrect = "You are Correct!"
var WarningLabelWrong = "Error, Try Again!"
var x = 0
var y = 0
var Counter = 0.01
var puzzleObject


func _ready():
	puzzleObject = get_parent()
	while [x < 35]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionOne[x]
		x += 1
		if x == 35:
			x = 0
			break


func _on_Circuit_area_entered(area):
	if area is CircuitElement:
		$InstructionLabel.text = ""
		$Ammeter.dragMouse = false
		$Ammeter/Button.visible = false
		$Ia.visible = true
		$Ia.grab_focus()
		while [x < 32]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel.text += InstructionTwo[x]
			x += 1
			if x == 32:
				x = 0
				break


func _on_Ia_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "0.019" or new_text == "19mA":
		puzzleObject.update_puzzle(true)
		while [x < 16]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelCorrect[x]
			x += 1
			if x == 16:
				x = 0
				break
	else:
		while [x < 17]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[x]
			x += 1
			if x == 17:
				x = 0
				break
