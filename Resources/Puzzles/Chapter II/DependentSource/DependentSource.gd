extends Puzzle


func _ready():
	pass


func _on_A_text_entered(new_text):
	if new_text == "0.6":
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
