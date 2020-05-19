extends Puzzle

var Voltage = false
var Current = false
var Two = false
var InstructionOne = "An ideal basic circuit element has how many terminals>"
var InstructionTwo = ">An ideal basic circuit element is described mathematically\nin terms of>"
var WarningLabelWrong = "Error, Try Again!"
var WarningLabelCorrect = "You Are Correct!"
var Counter = 0.01
var x = 0
var y = 0
var puzzleObject

func _ready():
	puzzleObject = get_parent()
	$InstructionLabel/Two.grab_focus()
	while [x < 54]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionOne[x]
		x += 1
		if x == 54:
			break


func _on_Two_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "Two" or new_text == "2":
		$InstructionLabel2/Current.grab_focus()
		$InstructionLabel/Two.visible = false
		$WarningLabel.text = ""
		while [y < 72]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel2.text += InstructionTwo[y]
			y += 1
			if y == 72:
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


func _on_Current_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "voltage" or new_text == "current":
		$InstructionLabel2/Voltage.grab_focus()
		$InstructionLabel2/Current.visible = false
		$WarningLabel.text = ""
	else:
		while [y < 16]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 16:
				y = 0
				break


func _on_Voltage_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "voltage" or new_text == "current":
		$InstructionLabel2/Voltage.visible = false
		puzzleObject.update_puzzle(true)
		while [y < 16]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelCorrect[y]
			y += 1
			if y == 16:
				y = 0
				break
	else:
		while [y < 16]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 16:
				y = 0
				break

