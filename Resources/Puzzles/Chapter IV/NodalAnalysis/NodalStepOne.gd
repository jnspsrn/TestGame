extends Puzzle

export (bool) var solved
var checker
var puzzleObject


func _ready():
	puzzleObject = get_parent()
	$NodeVoltages.visible = false
	$Submit.visible = false


func _on_Ground_area_entered(area):
	if area is NodalCircuit:
		$Ground.dragMouse = false
		$NodeVoltages.visible = true
		$Submit.visible = true
		$InstructionLabel.text = "Correct! Now identify the node voltages."

func _on_V1_text_entered(new_text):
	if new_text == "v1" or new_text == "v2":
		checker = "1"
		
func _on_V2_text_entered(new_text):
	if new_text == "v1" or new_text == "v2":
		checker = checker + "2"
		
func _on_Submit_pressed():
	if checker == "12" or checker == "21":
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
