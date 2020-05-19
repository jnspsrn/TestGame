extends Puzzle

var Io = false

func _ready():
	pass


func _on_Io_text_entered(new_text):
	if new_text == "0.72":
		Io = true
func _on_Submit_pressed():
	if Io == true:
		$WarningLabel.text = "You Are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
