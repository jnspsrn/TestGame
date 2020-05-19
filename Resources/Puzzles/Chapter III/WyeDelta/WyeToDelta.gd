extends Puzzle

export (bool) var solved
var doorPanel
var checker = 0

func _ready():
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"

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
		$WarningLabel.text = "You Are Correct!"
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		$WarningLabel.text = "Try Again!"
