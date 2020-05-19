extends Puzzle

export (bool) var solved
var checker = 0
var puzzleObject

func _ready():
	puzzleObject = get_parent()

func _on_Submit_pressed():
	if $Resistor1.Resistor1Nodes.has("CircuitNode") and $Resistor1.Resistor1Nodes.has("CircuitNode2"):
		checker += 1
	if $Resistor2.Resistor2Nodes.has("CircuitNode2") and $Resistor2.Resistor2Nodes.has("CircuitNode3"):
		checker += 1
	if $Resistor3.Resistor3Nodes.has("CircuitNode2") and $Resistor3.Resistor3Nodes.has("CircuitNode4"):
		checker += 1
	_checker()

func _checker():
	if checker == 3:
		
		$WarningLabel.text = "You Are Correct!"
		puzzleObject.update_puzzle(true)
	else:
		$WarningLabel.text = "Try Again!"
