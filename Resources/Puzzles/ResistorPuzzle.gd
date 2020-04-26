extends Puzzle
class_name ResistorPuzzle

export (float) var neededValue = 0

onready var resistor = $Resistor
onready var warningLabel = $WarningLabel
onready var warningTimer = $WarningTimer
onready var neededValueLabel = $NeededValueLabel

func _ready():
	warningLabel.visible = false
	neededValueLabel.text = str(neededValue)

func _physics_process(delta):
	if warningTimer.time_left == 0:
			warningLabel.visible = false

func _on_SubmitButton_pressed():
	var sumbittedValue = resistor.resistorValue
	if sumbittedValue == neededValue:
		warningLabel.text = "You are correct!"
		warningLabel.visible = true
		warningTimer.start()
	else:
		warningLabel.text = "Try again!"
		warningLabel.visible = true
		warningTimer.start()
