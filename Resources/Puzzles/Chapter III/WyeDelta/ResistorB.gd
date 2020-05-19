extends Resistor

var ResistorBNodes = []

func _ready():
	pass 


func _on_Button_pressed():
	dragMouse = true


func _on_ResistorB_area_entered(area):
	if area is CircuitNode:
		ResistorBNodes.push_back(area.get_name())


func _on_ResistorB_area_exited(area):
	if area is CircuitNode:
		ResistorBNodes.erase(area.get_name())


