extends Puzzle
class_name ResistorPuzzle

export (float) var neededValue = 0
export(bool) var solved

onready var resistor = $Resistor
onready var warningLabel = $WarningLabel
onready var warningTimer = $WarningTimer
onready var neededValueLabel = $NeededValueLabel

var puzzleObject

#signal puzzle_answered(result)

func _ready():
	puzzleObject = get_parent()
	warningLabel.visible = false
	neededValueLabel.text = str(neededValue)
	if puzzleObject.puzzle_solved:
		solved = true
		warningLabel.visible = true
		warningLabel.text = "Already solved!"
		warningTimer.start()

func _physics_process(_delta):
	if warningTimer.time_left == 0:
			warningLabel.visible = false

func _on_SubmitButton_pressed():
	var sumbittedValue = resistor.resistorValue
	if sumbittedValue == neededValue:
		warningLabel.text = "You are correct!"
		warningLabel.visible = true
		warningTimer.start()
		solved = true
		puzzleObject.update_puzzle(solved)
	else:
		warningLabel.text = "Try again!"
		warningLabel.visible = true
		warningTimer.start()
