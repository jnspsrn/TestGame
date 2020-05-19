extends Puzzle

var Valid = false
var Invalid = false

func _ready():
	pass


func _on_Invalid_text_entered(new_text):
	if new_text == "Invalid" or new_text == "invalid":
		Invalid = true

func _on_Valid_text_entered(new_text):
	if new_text == "Valid" or new_text == "valid":
		Valid = true

func _on_Submit_pressed():
	if Valid == true and Invalid == true:
		$WarningLabel.text = "You Are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
