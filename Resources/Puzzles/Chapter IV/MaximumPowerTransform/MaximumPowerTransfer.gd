extends Puzzle

var Vth = false
var Rth = false
var puzzleObject

func _ready():
	var puzzleObject
	pass

func _checker():
	if Rth == true and Vth == true:
		puzzleObject = get_parent()
		$Pmax.visible = true
		$Sprite.visible = false
		$Sprite2.visible = true
		$InstructionLabel.text = "Since Rth = RL, Get Pmax at RL"

func _on_Vth_text_entered(new_text):
	if new_text == "300":
		Vth = true
		$WarningLabel.text = ""
		_checker()
	else:
		$WarningLabel.text = "Try Again!"

func _on_Rth_text_entered(new_text):
	if new_text == "25":
		Rth = true
		$WarningLabel.text = ""
		_checker()
	else:
		$WarningLabel.text = "Try Again!"

func _on_Pmax_text_entered(new_text):
	if new_text == "900":
		$WarningLabel.text = "Correct!"
