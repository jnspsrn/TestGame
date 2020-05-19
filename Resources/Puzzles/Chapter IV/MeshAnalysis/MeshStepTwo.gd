extends Puzzle

var MeshA = false
var MeshB = false
var MeshC = false
var ia = false
var ib = false
var ic = false

func _ready():
	$Currents.visible = false
	pass

func _on_MeshA_text_entered(new_text):
	if new_text == "ia-ib":
		MeshA = true
		_checker()
func _on_MeshB_text_entered(new_text):
	if new_text == "ib-ic":
		MeshB = true
		_checker()
func _on_MeshC_text_entered(new_text):
	if new_text == "20":
		MeshC = true
		_checker()

func _checker():
	if MeshA == true and MeshB == true and MeshC == true:
		$Currents.visible = true
		$InstructionLabel.text = "Get ia, ib, ic"

func _on_Ia_text_entered(new_text):
	if new_text == "5.6":
		ia = true
func _on_Ib_text_entered(new_text):
	if new_text == "2":
		ib = true
func _on_Ic_text_entered(new_text):
	if new_text == "-0.8":
		ic = true



func _on_Submit_pressed():
	if ia == true and ib == true and ic == true:
		$Currents/WarningLabel.text = "Correct!"
	else:
		$Currents/WarningLabel.text = "Try Again!"
