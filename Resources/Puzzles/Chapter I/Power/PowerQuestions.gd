extends Puzzle

var Energy = false
var Time = false

func _ready():
	$InstructionLabel2.visible = false
	pass


func _on_Power_text_entered(new_text):
	if new_text == "Power" or new_text == "power":
		$InstructionLabel2.visible = true

func _on_Energy_text_entered(new_text):
	if new_text == "Energy" or new_text == "energy":
		Energy = true

func _on_Time_text_entered(new_text):
	if new_text == "time" or new_text == "Time":
		Time = true

func _on_Submit_pressed():
	if Time == true and Energy == true:
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!" 
