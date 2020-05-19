extends Puzzle

var ResNodes = []
var VoltageNodes = []
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

func _on_VoltageSource_area_entered(area):
	if area is CircuitNode:
		VoltageNodes.push_back(area.get_name())
func _on_VoltageSource_area_exited(area):
	if area is CircuitNode:
		VoltageNodes.erase(area.get_name())

func _on_Submit_pressed():
	if ResNodes.has("CircuitNode") and VoltageNodes.has("CircuitNode"):
		$Wire1.add_point(Vector2($CircuitNode3.position))
		$Wire1.add_point(Vector2($CircuitNode4.position))
		$Wire2.add_point(Vector2($CircuitNode2.position))
		$Wire2.add_point(Vector2($CircuitNode4.position))
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You are Correct!"
	elif ResNodes.has("CircuitNode2") and VoltageNodes.has("CircuitNode2"):
		$Wire1.add_point(Vector2($CircuitNode.position))
		$Wire1.add_point(Vector2($CircuitNode3.position))
		$Wire2.add_point(Vector2($CircuitNode3.position))
		$Wire2.add_point(Vector2($CircuitNode4.position))
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You are Correct!"
	elif ResNodes.has("CircuitNode3") and VoltageNodes.has("CircuitNode3"):
		$Wire1.add_point(Vector2($CircuitNode.position))
		$Wire1.add_point(Vector2($CircuitNode2.position))
		$Wire2.add_point(Vector2($CircuitNode2.position))
		$Wire2.add_point(Vector2($CircuitNode4.position))
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You are Correct!"
	elif ResNodes.has("CircuitNode4") and VoltageNodes.has("CircuitNode4"):
		$Wire1.add_point(Vector2($CircuitNode.position))
		$Wire1.add_point(Vector2($CircuitNode2.position))
		$Wire2.add_point(Vector2($CircuitNode.position))
		$Wire2.add_point(Vector2($CircuitNode3.position))
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
