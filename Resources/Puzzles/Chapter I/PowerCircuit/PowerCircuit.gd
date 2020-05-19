extends Puzzle

export (bool) var solved
var doorPanel
var checker = 0
var AnswerA = "90"
var AnswerB = "-210"
var AnswerC = "80"
var AnswerD = "-200"
var AnswerE = "600"
var AnswerF = "-360"

func _ready():
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"


func _count_correct():
	if checker == 6:
		$WarningLabel.text = "All Power Correct!"
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		pass





func _check_answer(Letter, Answer):
	if Letter == "A":
		if Answer == AnswerA:
			$WarningLabel.text = "Power At A Correct!"
			checker += 1
			_count_correct()
		else:
			$WarningLabel.text = "Power At A Incorrect!"
	elif Letter == "B":
		if Answer == AnswerB:
			$WarningLabel.text = "Power At B Correct!"
			checker += 1
			_count_correct()
		else:
			$WarningLabel.text = "Power At B Incorrect!"
	elif Letter == "C":
		if Answer == AnswerC:
			$WarningLabel.text = "Power At C Correct!"
			checker += 1
			_count_correct()
		else:
			$WarningLabel.text = "Power At C Incorrect!"
	elif Letter == "D":
		if Answer == AnswerD:
			$WarningLabel.text = "Power At D Correct!"
			checker += 1
			_count_correct()
		else:
			$WarningLabel.text = "Power At D Incorrect!"
	elif Letter == "E":
		if Answer == AnswerE:
			$WarningLabel.text = "Power At E Correct!"
			checker += 1
			_count_correct()
		else:
			$WarningLabel.text = "Power At E Incorrect!"
	elif Letter == "F":
		if Answer == AnswerF:
			$WarningLabel.text = "Power At F Correct!"
			checker += 1
			_count_correct()
		else:
			$WarningLabel.text = "Power At F Incorrect!"



func _on_PowerAtA_text_entered(new_text):
	var user_answer = $PowerAtA.text
	_check_answer("A", user_answer)
func _on_PowerAtB_text_entered(new_text):
	var user_answer = $PowerAtB.text
	_check_answer("B", user_answer)
func _on_PowerAtC_text_entered(new_text):
	var user_answer = $PowerAtC.text
	_check_answer("C", user_answer)
func _on_PowerAtD_text_entered(new_text):
	var user_answer = $PowerAtD.text
	_check_answer("D", user_answer)
func _on_PowerAtE_text_entered(new_text):
	var user_answer = $PowerAtE.text
	_check_answer("E", user_answer)
func _on_PowerAtF_text_entered(new_text):
	var user_answer = $PowerAtF.text
	_check_answer("F", user_answer)
