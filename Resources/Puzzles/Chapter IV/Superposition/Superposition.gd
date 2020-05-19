extends Puzzle

var CurrentOff = false
var VoltageOff = false
var puzzleObject


func _ready():
	puzzleObject = get_parent()
	pass

func _on_CurrentOff_pressed():
	if VoltageOff == false:
		CurrentOff = true
		$Sprite.visible = false
		$Sprite2.visible = true
		$CurrentOff.disabled = true
		$Vo1.visible = true
		$InstructionLabel.text = "Now solve for vo'."

func _on_VoltageOff_pressed():
	if CurrentOff == true :
		$Sprite2.visible = false
		$Sprite3.visible = true
		$CurrentOff.disabled = true
		$Vo2.visible = true
		$InstructionLabel.text = "Now solve for vo''."

func _on_Vo1_text_entered(new_text):
	if new_text == "8":
		$InstructionLabel.text = "Now turn off the voltage Source."
		$WarningLabel.text = ""
	else:
		$WarningLabel.text = "Try Again!"
func _on_Vo2_text_entered(new_text):
	if new_text == "16":
		$Vo.visible = true
		$InstructionLabel.text = "Now get vo by adding vo' and vo''"
		$WarningLabel.text = ""
	else:
		$WarningLabel.text = "Try Again!"
func _on_Vo_text_entered(new_text):
	if new_text == "24":
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
