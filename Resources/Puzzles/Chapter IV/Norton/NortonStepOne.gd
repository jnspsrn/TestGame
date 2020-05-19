extends Puzzle

var ResNodes = []
var CurrentNodes = []
var In = false
var Rn = false
var puzzleObject


func _ready():
	puzzleObject = get_parent()
	pass


func _on_Resistor_area_entered(area):
	if area is CircuitNode:
		ResNodes.push_back(area.get_name())
func _on_Resistor_area_exited(area):
	if area is CircuitNode:
		ResNodes.erase(area.get_name())

func _on_CurrentSource_area_entered(area):
	if area is CircuitNode:
		CurrentNodes.push_back(area.get_name())
func _on_CurrentSource_area_exited(area):
	if area is CircuitNode:
		CurrentNodes.erase(area.get_name())


func _on_Submit_pressed():
	if ResNodes.has("CircuitNode") and ResNodes.has("CircuitNode2"):
		if CurrentNodes.has("CircuitNode3") and CurrentNodes.has("CircuitNode4"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			$InstructionLabel.text = "You Are Correct!"
			puzzleObject.update_puzzle(true)
	elif ResNodes.has("CircuitNode3") and ResNodes.has("CircuitNode4"):
		if CurrentNodes.has("CircuitNode") and CurrentNodes.has("CircuitNode2"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			$InstructionLabel.text = "You Are Correct!"
			puzzleObject.update_puzzle(true)
	elif ResNodes.has("CircuitNode") and ResNodes.has("CircuitNode3"):
		if CurrentNodes.has("CircuitNode2") and CurrentNodes.has("CircuitNode4"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			$InstructionLabel.text = "You Are Correct!"
			puzzleObject.update_puzzle(true)
	elif ResNodes.has("CircuitNode2") and ResNodes.has("CircuitNode4"):
		if CurrentNodes.has("CircuitNode") and CurrentNodes.has("CircuitNode3"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			$InstructionLabel.text = "You Are Correct!"
			puzzleObject.update_puzzle(true)
	else:
		$InstructionLabel.text = "Try Again!"

func _on_In_text_entered(new_text):
	if new_text == "4":
		$CurrentSource/Label.text = "4"
		In = true

func _on_Rn_text_entered(new_text):
	if new_text == "8":
		$Resistor/Label.text = "8"
		Rn = true

func _on_Button1_pressed():
	if Rn == true:
		$Resistor.dragMouse = true
	else:
		$InstructionLabel.text = "Get In and Rn First!"

func _on_Button2_pressed():
	if In == true:
		$CurrentSource.dragMouse = true
	else:
		$InstructionLabel.text = "Get In and Rn First!"
