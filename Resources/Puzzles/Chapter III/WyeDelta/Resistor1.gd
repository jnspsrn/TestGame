extends Resistor

var Resistor1Nodes = []

func _ready():
	pass 

func _on_Resistor1_area_entered(area):
	if area is CircuitNode:
		Resistor1Nodes.push_back(area.get_name())

func _on_Resistor1_area_exited(area):
	if area is CircuitNode:
		Resistor1Nodes.erase(area.get_name())

func _on_Button_pressed():
	dragMouse = true
