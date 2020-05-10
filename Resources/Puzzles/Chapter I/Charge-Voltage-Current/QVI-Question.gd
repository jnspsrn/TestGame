extends Puzzle

var correctAnswer = true
export(bool) var playerAnswer = null
export(bool) var is_correct

func _ready():
	pass

func _on_True_pressed():
	playerAnswer = true
	verify(playerAnswer)

func _on_False_pressed():
	playerAnswer = false
	verify(playerAnswer)

func verify(answer):
	if correctAnswer == answer:
		is_correct = true
		print("You are correct!")
		emit_signal("answered", is_correct)
	else:
		is_correct = false
		print("Try again!")
		emit_signal("answered", is_correct)

func save():
	return {
		"puzzle_id" : puzzle_id,
		"filename" : filename,
		"is_correct" : is_correct
	}
