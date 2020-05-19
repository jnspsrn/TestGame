extends Puzzle

var Leq1 = false
var Leq2 = false

func _ready():
	pass


func _on_Leq1_text_entered(new_text):
	if new_text == "11.8":
		Leq1 = true
func _on_Leq2_text_entered(new_text):
	if new_text == "2.35":
		Leq2 = true
func _on_Submit_pressed():
	if Leq1 == true and Leq2 == true:
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
