extends Puzzle

var Voltage = false
var Current = false
var InstructionOne = "Electric effects are in terms of + and -, meaning Charge is >"
var InstructionTwo = ">In Circuit Theory, the separation of charge creates>"
var WarningLabelWrong = "Error, Try Again!"
var WarningLabelCorrect = "You Are Correct!"
var Counter = 0.01
var x = 0
var y = 0
var puzzleObject

func _ready():
	puzzleObject = get_parent()
	$InstructionLabel1/Bipolar.grab_focus()
	while [x < 61]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel1.text += InstructionOne[x]
		x += 1
		if x == 61:
			break


func _on_Bipolar_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "bipolar" or new_text == "Bipolar":
		$InstructionLabel2.visible = true
		$InstructionLabel2/Voltage.grab_focus()
		$InstructionLabel1/Bipolar.visible = false
		$WarningLabel.text = ""
		while [y < 53]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel2.text += InstructionTwo[y]
			y += 1
			if y == 53:
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
func _on_Voltage_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "voltage" or new_text == "current":
		Voltage = true
		$InstructionLabel2/Current.grab_focus()
		$InstructionLabel2/Voltage.visible = false
		$WarningLabel.text = ""
	else:
		while [y < 16]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 16:
				y = 0
				break
func _on_Current_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "voltage" or new_text == "current":
		puzzleObject.update_puzzle(true)
		Current = true
		$InstructionLabel2/Current.visible = false
		if Voltage == true and Current == true:
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
