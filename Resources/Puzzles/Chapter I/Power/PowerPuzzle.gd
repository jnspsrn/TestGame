extends Puzzle

export (bool) var solved
var doorPanel
var InstructionLabel = "Calculate Power at the Load B"
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"
var y = 0
var x = 0
var Counter = 0.01
var puzzleObject
 

func _ready():
	puzzleObject = get_parent()
	$LineEdit.grab_focus()
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"
	while [x < 29]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstuctionLabel.text += InstructionLabel[x]
		x += 1
		if x == 29:
			break
	pass

func _on_LineEdit_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "1440" or new_text == "1440W" or new_text == "1.44KW":
		puzzleObject.update_puzzle(true)
		solved = true
		doorPanel.update_puzzle(solved)
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
