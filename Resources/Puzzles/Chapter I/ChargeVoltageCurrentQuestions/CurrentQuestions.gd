extends Puzzle

var Charge = false
var Time = false
var InstructionOne = "The electrical effects caused by charges in motion is called>"
var InstructionTwo = ">Current is _____ moved per ____ (I = dq/dt) >"
var WarningLabelWrong = "Error, Try Again!"
var WarningLabelCorrect = "You Are Correct!"
var Counter = 0.01
var x = 0
var y = 0

func _ready():
	$InstructionLabel/Current.grab_focus()
	while [x < 61]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionOne[x]
		x += 1
		if x == 61:
			break


func _on_Current_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "current" or new_text == "Current":
		$InstructionLabel2.visible = true
		$InstructionLabel2/Charge.grab_focus()
		$InstructionLabel/Current.visible = false
		$WarningLabel.text = ""
		while [y < 46]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel2.text += InstructionTwo[y]
			y += 1
			if y == 46:
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
func _on_Charge_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "Charge" or new_text == "charge":
		Charge = true
		$InstructionLabel2/Time.grab_focus()
		$InstructionLabel2/Charge.visible = false
		$WarningLabel.text = ""
	else:
		while [y < 17]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 17:
				y = 0
				break
func _on_Time_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "time" or new_text == "Time":
		$InstructionLabel2/Time.visible = false
		Time = true
		$WarningLabel.text = ""
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

