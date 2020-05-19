extends Puzzle

var VoltageValue = 0
var InstructionOne = "Reduce the circuit."
var InstructionTwo = "Get the voltage Around Vo."
var x = 0
var y = 0
var Counter = 0
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"
var Parallel = 0
var puzzleObject


func _ready():
	puzzleObject = get_parent()
	while [x < 19]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionOne[x]
		x += 1
		if x == 19:
			x = 0
			break





func _on_ResOne_pressed():
	$ResOne.visible = false
	if Parallel == 1:
		$InstructionLabel.text = ""
		$Sprite3.visible = true
		$Sprite2.visible = false
		$VoltageValue.visible = true
		$VoltageLabel.visible = true
		while [x < 26]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel.text += InstructionTwo[x]
			x += 1
			if x == 26:
				x = 0
				break
	else:
		Parallel += 1 
func _on_ResTwo_pressed():
	$ResTwo.visible = false
	if Parallel == 1:
		$InstructionLabel.text = ""
		$Sprite3.visible = true
		$Sprite2.visible = false
		$VoltageValue.visible = true
		$VoltageLabel.visible = true
		while [x < 26]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel.text += InstructionTwo[x]
			x += 1
			if x == 26:
				x = 0
				break
	else:
		Parallel += 1 

func _on_Plus_pressed():
	VoltageValue += 1
	$VoltageValue.text = str(VoltageValue) + "V"
func _on_Minus_pressed():
	VoltageValue -= 1
	$VoltageValue.text = str(VoltageValue) + "V"


func _on_Submit_pressed():
	$WarningLabel.text = ""
	if VoltageValue == 50:
		puzzleObject.update_puzzle(true)
		while [y < 8]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelCorrect[y]
			y += 1
			if y == 8:
				y = 0
				break
	else:
		while [y < 6]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 6:
				y = 0
				break

