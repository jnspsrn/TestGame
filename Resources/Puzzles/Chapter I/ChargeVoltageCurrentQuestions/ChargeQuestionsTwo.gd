extends Puzzle

var Positive = false
var Negative = false
var Neutral = false
var InstructionOne = "The two types of Electric Charge are>"
var InstructionTwo = ">An object with an absence of net charge is referred to as>"
var WarningLabelWrong = "Error, Try Again!"
var WarningLabelCorrect = "You Are Correct!"
var Counter = 0.01
var x = 0
var y = 0


func _ready():
	$InstructionLabel1/Positive.grab_focus()
	while [x < 37]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel1.text += InstructionOne[x]
		x += 1
		if x == 37:
			break
	pass


func _on_Positive_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "positive" or new_text == "negative":
		$InstructionLabel1/Negative.grab_focus()
		$InstructionLabel1/Positive.visible = false
		$WarningLabel.text = ""
	else:
		while [y < 17]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 17:
				y = 0
				break

func _on_Negative_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "negative" or new_text == "positive":
		
		$InstructionLabel2/Neutral.grab_focus()
		$InstructionLabel1/Negative.visible = false
		while [y < 59]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel2.text += InstructionTwo[y]
			y += 1
			if y == 59:
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
func _on_Neutral_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "neutral" or new_text == "Neutral":
		$InstructionLabel2/Neutral.visible = false
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
