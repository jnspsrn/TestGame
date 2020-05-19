extends Puzzle

export (bool) var solved
var doorPanel
var checker = 0
var InstructionOne = "Identify which Resistors are in Series."
var InstructionTwo = "Identify which Resistors are in Parallel."
var x = 0
var y = 0
var Counter = 0.01
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"


func _ready():
	$Series/Series1.grab_focus()
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"
	while [x < 39]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionOne[x]
		x += 1
		if x == 39:
			x = 0
			break

func _on_Series1_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "R1" or new_text == "R2":
		$Series/Series2.grab_focus()
	else:
		while [y < 6]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 6:
				y = 0
				break
func _on_Series2_text_entered(new_text):
	$InstructionLabel.text = ""
	$WarningLabel.text = ""
	if new_text == "R1" or new_text == "R2":
		$Parallel.visible = true
		$Parallel/Parallel1.grab_focus()
		while [x < 41]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel.text += InstructionTwo[x]
			x += 1
			if x == 41:
				x = 0
				break
	else:
		while [y < 6]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 6:
				y = 0
				break

func _on_Parallel1_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "R3" or new_text == "R4":
		$Parallel/Parallel2.grab_focus()
	else:
		while [y < 6]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 6:
				y = 0
				break
func _on_Parallel2_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "R3" or new_text == "R4":
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

