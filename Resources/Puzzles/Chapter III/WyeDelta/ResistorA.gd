extends Resistor

var ResistorANodes = []
 
func _ready():
	pass


func _on_Button_pressed():
	dragMouse = true


func _on_ResistorA_area_entered(area):
	if area is CircuitNode:
		ResistorANodes.push_back(area.get_name())


func _on_ResistorA_area_exited(area):
	if area is CircuitNode:
		ResistorANodes.erase(area.get_name())
