extends CircuitElementPuzzle

export (bool) var solved
var puzzleObject

var PolarityLabel = "P = iv"
var WarningLabelWrong = "Error, Try Again!"
var WarningLabelCorrect = "You Are Correct!"
var y = 0

func _ready():
	puzzleObject = get_parent()
	if puzzleObject.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"
	yield(get_tree().create_timer(1), "timeout")
	while [x < 6]:
		yield(get_tree().create_timer(Counter), "timeout")
		$PolarityLabel.text += PolarityLabel[x]
		x += 1
		if x == 6:
			x = 0
			break

func _on_Arrow_pressed():
	$WarningLabel.text = ""
	$Arrow2.visible = false
	while [y < 16]:
		yield(get_tree().create_timer(Counter), "timeout")
		$WarningLabel.text += WarningLabelCorrect[y]
		y += 1
		if y == 16:
			y = 0
			break
	solved = true
	puzzleObject.update_puzzle(solved)

func _on_Arrow2_pressed():
	$WarningLabel.text = ""
	$Arrow.visible = false
	while [y < 16]:
		yield(get_tree().create_timer(Counter), "timeout")
		$WarningLabel.text += WarningLabelCorrect[y]
		y += 1
		if y == 16:
			y = 0
			break
	solved = true
	puzzleObject.update_puzzle(solved)
