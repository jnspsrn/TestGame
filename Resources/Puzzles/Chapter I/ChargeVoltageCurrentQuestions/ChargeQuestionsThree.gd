extends Puzzle

var Subatomic = false
var Protons = false
var Electrons = false
var InstructionOne = "Electric charge is carried by >"
var InstructionTwoA = ">Negative charge is carried by>"
var InstructionTwoB = ">Positive charge is carried by>"
var WarningLabelWrong = "Error, Try Again!"
var WarningLabelCorrect = "You Are Correct!"
var Counter = 0.01
var x = 0
var y = 0
var puzzleObject

func _ready():
	$InstructionLabel/SubatomicParticles.grab_focus()
	puzzleObject = get_parent()
	while [x < 31]:
		yield(get_tree().create_timer(Counter), "timeout")
		$InstructionLabel.text += InstructionOne[x]
		x += 1
		if x == 31:
			break
	pass


func _on_SubatomicParticles_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "subatomic particles" or new_text == "Subatomic particles":
		$InstructionLabel2/Electrons.grab_focus()
		$InstructionLabel/SubatomicParticles.visible = false
		$WarningLabel.text = ""
		while [y < 31]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel2.text += InstructionTwoA[y]
			y += 1
			if y == 31:
				y = 0
				break
	else:
		while [y < 17]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 17:
				y = 0
				break

func _on_Electrons_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "electrons" or new_text == "Electrons":
		$InstructionLabel2.text = ""
		$InstructionLabel2/Protons.grab_focus()
		$InstructionLabel2/Electrons.visible = false
		$WarningLabel.text = ""
		while [y < 31]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel2.text += InstructionTwoB[y]
			y += 1
			if y == 31:
				y = 0
				break
	else:
		while [y < 17]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 17:
				y = 0
				break
func _on_Protons_text_entered(new_text):
	$WarningLabel.text = ""
	if new_text == "protons" or new_text == "Protons":
		puzzleObject.update_puzzle(true)
		$InstructionLabel2/Protons.visible = false
		while [y < 16]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelCorrect[y]
			y += 1
			if y == 16:
				y = 0
				break
	else:
		while [y < 17]:
			yield(get_tree().create_timer(Counter), "timeout")
			$WarningLabel.text += WarningLabelWrong[y]
			y += 1
			if y == 17:
				y = 0
				break
