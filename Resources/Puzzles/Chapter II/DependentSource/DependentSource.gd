extends Puzzle

var puzzleObject
 

func _ready():
	puzzleObject = get_parent()
	pass


func _on_A_text_entered(new_text):
	if new_text == "0.6":
		$WarningLabel.text = "You are Correct!"
		puzzleObject.update_puzzle(true)
	else:
		$WarningLabel.text = "Try Again!"
