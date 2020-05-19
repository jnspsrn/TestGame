extends Puzzle

var Ceq1 = false
var Ceq2 = false
var puzzleObject
 

func _ready():
	puzzleObject = get_parent()
	pass



func _on_Ceq1_text_entered(new_text):
	if new_text == "1.43":
		Ceq1 = true
func _on_Ceq2_text_entered(new_text):
	if new_text == "20":
		Ceq2 = true
func _on_Submit_pressed():
	if Ceq1 == true and Ceq2 == true:
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
