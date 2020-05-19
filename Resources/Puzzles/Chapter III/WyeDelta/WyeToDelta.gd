extends Puzzle

export (bool) var solved

var checker = 0
var puzzleObject
 

func _ready():
	puzzleObject = get_parent()

func _on_Submit_pressed():
	if $ResistorA.ResistorANodes.has("CircuitNode2") and $ResistorA.ResistorANodes.has("CircuitNode3"): 
		checker += 1
	if $ResistorB.ResistorBNodes.has("CircuitNode") and $ResistorB.ResistorBNodes.has("CircuitNode3"): 
		checker += 1
	if $ResistorC.ResistorCNodes.has("CircuitNode") and $ResistorC.ResistorCNodes.has("CircuitNode2"): 
		checker += 1
	_checker()
	
func _checker():
	if checker == 3:
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You Are Correct!"

	else:
		$WarningLabel.text = "Try Again!"
