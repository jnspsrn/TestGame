extends Resistor

var Resistor2Nodes = []

func _ready():
	pass 

func _on_Resistor2_area_entered(area):
	if area is CircuitNode:
		Resistor2Nodes.push_back(area.get_name())

func _on_Resistor2_area_exited(area):
	if area is CircuitNode:
		Resistor2Nodes.erase(area.get_name())

func _on_Button_pressed():
	dragMouse = true
