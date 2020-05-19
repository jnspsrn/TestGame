extends Puzzle

var Io = false
var puzzleObject
 

func _ready():
	puzzleObject = get_parent()


func _on_Io_text_entered(new_text):
	if new_text == "0.72":
		Io = true
func _on_Submit_pressed():
	if Io == true:
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You Are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
