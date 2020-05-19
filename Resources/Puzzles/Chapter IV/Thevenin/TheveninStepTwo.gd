extends Puzzle

var puzzleObject
 
func _ready():
	puzzleObject = get_parent()
	pass


func _on_V2_text_entered(new_text):
	if new_text == "16":
		$InstructionLabel.text = "Now get isc."
		$Isc.visible = true
	else:
		$InstructionLabel.text = "Try Again!"
func _on_Isc_text_entered(new_text):
	if new_text == "4":
		$InstructionLabel.text = "With Vth and Isc known, get Rth"
		$Rth.visible = true
	else:
		$InstructionLabel.text = "Try Again!"
func _on_Rth_text_entered(new_text):
	if new_text == "8":
		puzzleObject.update_puzzle(true)
		$InstructionLabel.text = "Correct!, The Thevenin equivalent circuit:"
		$Sprite.visible = false
		$Sprite2.visible = true
	else:
		$InstructionLabel.text = "Try Again!"
