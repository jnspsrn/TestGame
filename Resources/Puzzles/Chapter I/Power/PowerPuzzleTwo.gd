extends Puzzle

export (bool) var solved
var InstructionLabel = "Calculate Power at the Resistor"
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"
var y = 0
var x = 0
var Counter = 0.01
var puzzleObject
 

func _ready():
	$LineEdit.grab_focus()
	puzzleObject = get_parent()
	if puzzleObject.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"
	while [x < 31]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionLabel[x]
		x += 1
		if x == 31:
			break
	pass

func _on_LineEdit_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "24" or new_text == "24W":
		solved = true
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
