extends SuitPuzzle

var WarningLabelWrong = "Try Again!"
var WarningLabelCorrect = "Youre Correct!"
var y = 0
var puzzleObject
 

func _ready():
	puzzleObject = get_parent()
	pass


func _on_Valid2_pressed():
	$WarningLabel.text = ""
	$Valid.visible = false
	puzzleObject.update_puzzle(true)
	while [y < 14]:
		yield(get_tree().create_timer(Counter), "timeout")
		$WarningLabel.text += WarningLabelCorrect[y]
		y += 1
		if y == 14:
			y = 0
			break


func _on_Valid_pressed():
	$WarningLabel.text = ""
	while [y < 10]:
		yield(get_tree().create_timer(Counter), "timeout")
		$WarningLabel.text += WarningLabelWrong[y]
		y += 1
		if y == 10:
			y = 0
			break
