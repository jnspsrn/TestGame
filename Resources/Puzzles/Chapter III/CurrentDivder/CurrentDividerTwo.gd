extends Puzzle

var FirstSeries = false
var FirstParallel = false
var SecondSeries = false
var InstructionOne = "Reduce the circuit."
var InstructionTwo = "Get the current, Ia."
var x = 0
var y = 0
var Counter = 0
var WarningLabelWrong = "Error!"
var WarningLabelCorrect = "Correct!"
var CurrentValue = 0
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
	if FirstSeries == true:
		$Circuit.texture = load("res://Resources/Objects/Circuit/CurrentDividerThree.png")
		$Circuit/ResOne.visible = false
		$Circuit/ResTwo.visible = false
		$Circuit/ResThree.visible = true
		$Circuit/ResFour.visible = true
	else:
		FirstSeries = true
func _on_ResTwo_pressed():
	if FirstSeries == true:
		$Circuit.texture = load("res://Resources/Objects/Circuit/CurrentDividerThree.png")
		$Circuit/ResOne.visible = false
		$Circuit/ResTwo.visible = false
		$Circuit/ResThree.visible = true
		$Circuit/ResFour.visible = true
	else:
		FirstSeries = true

func _on_ResThree_pressed():
	if FirstParallel == true:
		$Circuit.texture = load("res://Resources/Objects/Circuit/CurrentDividerFour.png")
		$Circuit/ResThree.visible = false
		$Circuit/ResFour.visible = false
		$Circuit/ResFive.visible = true
		$Circuit/ResSix.visible = true
	else:
		FirstParallel = true
func _on_ResFour_pressed():
	if FirstParallel == true:
		$Circuit.texture = load("res://Resources/Objects/Circuit/CurrentDividerFour.png")
		$Circuit/ResThree.visible = false
		$Circuit/ResFour.visible = false
		$Circuit/ResFive.visible = true
		$Circuit/ResSix.visible = true
	else:
		FirstParallel = true

func _on_ResFive_pressed():
	if SecondSeries == true:
		$CurrentValue.visible = true
		$InstructionLabel.text = ""
		$Circuit.texture = load("res://Resources/Objects/Circuit/CurrentDividerFive.png")
		$Circuit/ResFive.visible = false
		$Circuit/ResSix.visible = false
		while [x < 20]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel.text += InstructionTwo[x]
			x += 1
			if x == 20:
				x = 0
				break
	else:
		SecondSeries = true
func _on_ResSix_pressed():
	if SecondSeries == true:
		$CurrentValue.visible = true
		$InstructionLabel.text = ""
		$Circuit.texture = load("res://Resources/Objects/Circuit/CurrentDividerFive.png")
		$Circuit/ResFive.visible = false
		$Circuit/ResSix.visible = false
		while [x < 20]:
			yield(get_tree().create_timer(Counter), "timeout")
			$InstructionLabel.text += InstructionTwo[x]
			x += 1
			if x == 20:
				x = 0
				break
	else:
		SecondSeries = true

func _on_Plus_pressed():
	CurrentValue += 1
	$CurrentValue.text = str(CurrentValue) + "A"
func _on_Minus_pressed():
	CurrentValue -= 1
	$CurrentValue.text = str(CurrentValue) + "A"


func _on_Submit_pressed():
	$WarningLabel.text = ""
	if CurrentValue == 20:
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
