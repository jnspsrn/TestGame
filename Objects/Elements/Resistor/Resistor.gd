extends CircuitElement
class_name Resistor

func _ready():
	pass

func _on_CircuitNode_area_entered(area):
	dragMouse = false

func _on_Button_pressed():
	dragMouse = true
