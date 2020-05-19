extends Puzzle

var Valid = false
var Invalid = false
var puzzleObject
 

func _ready():
	puzzleObject = get_parent()
	pass

func _on_Invalid_text_entered(new_text):
	if new_text == "invalid" or new_text == "Invalid":
		Invalid = true

func _on_Valid_text_entered(new_text):
	if new_text == "valid" or new_text == "Valid":
		Valid = true

func _on_Submit_pressed():
	if Valid == true and Invalid == true:
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
