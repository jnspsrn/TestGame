extends Puzzle

var InstructionOne = "Connect the ammeter to the circuit."
var InstructionTwo = "What is the Correct Measurement?"
var x = 0
var y = 0
var Counter = 0.01

func _ready():
	while [x < 35]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionOne[x]
		x += 1
		if x == 35:
			x = 0
			break


func _on_Circuit_area_entered(area):
	if area is CircuitElement:
		$InstructionLabel.text = ""
		$Ammeter.dragMouse = false
		$Ammeter/Button.visible = false
		while [x < 35]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel.text += InstructionOne[x]
			x += 1
			if x == 35:
				x = 0
				break
