extends Resistor

var Resistor3Nodes = []

func _ready():
	pass

func _on_Resistor3_area_entered(area):
	if area is CircuitNode:
		Resistor3Nodes.push_back(area.get_name())

func _on_Resistor3_area_exited(area):
	if area is CircuitNode:
		Resistor3Nodes.erase(area.get_name())

func _on_Button_pressed():
	dragMouse = true
