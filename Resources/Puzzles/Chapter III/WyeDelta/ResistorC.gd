extends Resistor

var ResistorCNodes = []

func _ready():
	pass  


func _on_Button_pressed():
	dragMouse = true


func _on_ResistorC_area_entered(area):
	if area is CircuitNode:
		ResistorCNodes.push_back(area.get_name())


func _on_ResistorC_area_exited(area):
	if area is CircuitNode:
		ResistorCNodes.erase(area.get_name())
