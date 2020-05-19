extends Puzzle

export (bool) var solved
var doorPanel
var checker

func _ready():
	$NodeVoltages.visible = false
	$Submit.visible = false
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"

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
		$WarningLabel.text = "You are Correct!"
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		$WarningLabel.text = "Try Again!"
