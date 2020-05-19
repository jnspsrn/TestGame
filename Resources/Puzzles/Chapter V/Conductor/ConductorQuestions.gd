extends Puzzle

var ElectricCharge = false
var Voltage = false
var Zero = false

func _ready():
	pass


func _on_ElectricCharge_text_entered(new_text):
	if new_text == "Electric charge" or new_text == "electric charge":
		ElectricCharge = true
func _on_Voltage_text_entered(new_text):
	if new_text == "Voltage" or new_text == "voltage":
		Voltage = true
func _on_Zero_text_entered(new_text):
	if new_text == "zero" or new_text == "Zero":
		Zero = true
func _on_Submit_pressed():
	if Zero == true and Voltage == true and ElectricCharge == true:
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
