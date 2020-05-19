extends Puzzle

var Res1Nodes = []
var Res2Nodes = []
var InstructionOne = "Connect R1 and R2 in Parallel."
var InstructionTwo = "Get the Equivalent Resistor."
var x = 0
var y = 0
var Counter = 0.01
var Parallel = false
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"
var puzzleObject


func _ready():
	puzzleObject = get_parent()
	while [x < 30]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionOne[x]
		x += 1
		if x == 30:
			x = 0
			break


func _on_Resistor1_area_entered(area):
	if area is CircuitNode:
		Res1Nodes.push_back(area.get_name())
func _on_Resistor1_area_exited(area):
	if area is CircuitNode:
		Res1Nodes.erase(area.get_name())

func _on_Resistor2_area_entered(area):
	if area is CircuitNode:
		Res2Nodes.push_back(area.get_name())
func _on_Resistor2_area_exited(area):
	if area is CircuitNode:
		Res2Nodes.erase(area.get_name())

func _on_Submit_pressed():
	if Res1Nodes.has("CircuitNode") and Res1Nodes.has("CircuitNode2"):
		if Res2Nodes.has("CircuitNode3") and Res2Nodes.has("CircuitNode4"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			Parallel = true
			_Req()
	elif Res1Nodes.has("CircuitNode3") and Res1Nodes.has("CircuitNode4"):
		if Res2Nodes.has("CircuitNode") and Res2Nodes.has("CircuitNode2"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			Parallel = true
			_Req()
	elif Res1Nodes.has("CircuitNode") and Res1Nodes.has("CircuitNode3"):
		if Res2Nodes.has("CircuitNode2") and Res2Nodes.has("CircuitNode4"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			Parallel = true
			_Req()
	elif Res1Nodes.has("CircuitNode2") and Res1Nodes.has("CircuitNode4"):
		if Res2Nodes.has("CircuitNode") and Res2Nodes.has("CircuitNode3"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			Parallel = true
			_Req()
	else:
		while [y < 6]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 6:
				y = 0
				break

func _Req():
	$Req.grab_focus()
	$Submit.visible = false
	$WarningLabel.text = ""
	$InstructionLabel.text = ""
	$Req.visible = true
	if Parallel == true:
		$Resistor1/Label.text = "8"
		$Resistor2/Label.text = "4"
		while [x < 28]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel.text += InstructionTwo[x]
			x += 1
			if x == 28:
				x = 0
				break


func _on_Req_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "2.67" or new_text == "2.667":
		puzzleObject.update_puzzle(true)
		while [y < 8]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelCorrect[y]
			y += 1
			if y == 8:
				y = 0
				break
