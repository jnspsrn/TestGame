extends Puzzle

var Vo = false
var Pmax = false

func _ready():
	pass

func _on_Vo_text_entered(new_text):
	if new_text == "28.8":
		Vo = true
func _on_Pmax_text_entered(new_text):
	if new_text == "32.72":
		Pmax = true
func _on_Submit_pressed():
	if Vo == true and Pmax == true:
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
