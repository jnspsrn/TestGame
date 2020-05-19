extends Puzzle

export (bool) var solved
var doorPanel
var InstructionLabel = "Calculate Va."
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"
var VoltageA = "8"
var CurrentA = "-2"
var y = 0
var x = 0
var Counter = 0.01

func _ready():
	$VoltageA.grab_focus()
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"
	while [x < 13]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionLabel[x]
		x += 1
		if x == 13:
			break



func _on_VoltageA_text_entered(new_text):
	$WarningLabel.text = ""
	if $VoltageA.text == VoltageA:
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

