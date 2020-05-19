extends Puzzle

var ResNodes = []
var CurrentNodes = []

func _ready():
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
			$WarningLabel.text = "You Are Correct!"
	elif ResNodes.has("CircuitNode3") and ResNodes.has("CircuitNode4"):
		if CurrentNodes.has("CircuitNode") and CurrentNodes.has("CircuitNode2"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			$WarningLabel.text = "You Are Correct!"
	elif ResNodes.has("CircuitNode") and ResNodes.has("CircuitNode3"):
		if CurrentNodes.has("CircuitNode2") and CurrentNodes.has("CircuitNode4"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			$WarningLabel.text = "You Are Correct!"
	elif ResNodes.has("CircuitNode2") and ResNodes.has("CircuitNode4"):
		if CurrentNodes.has("CircuitNode") and CurrentNodes.has("CircuitNode3"):
			$Wire1.add_point(Vector2($CircuitNode.position))
			$Wire1.add_point(Vector2($CircuitNode2.position))
			$Wire2.add_point(Vector2($CircuitNode3.position))
			$Wire2.add_point(Vector2($CircuitNode4.position))
			$WarningLabel.text = "You Are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
