extends Puzzle

var Inductance = false
var Zero = false
var Inductor = false

func _ready():
	pass


func _on_Inductance_text_entered(new_text):
	if new_text == "inductance" or new_text == "Inductance":
		Inductance = true
func _on_Zero_text_entered(new_text):
	if new_text == "zero" or new_text == "Zero":
		Zero = true
func _on_Inductor_text_entered(new_text):
	if new_text == "Inductor" or new_text == "inductor":
		Inductor = true
func _on_Submit_pressed():
	if Inductance == true and Zero == true and Inductor == true:
		$WarningLabel.text = "You Are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
