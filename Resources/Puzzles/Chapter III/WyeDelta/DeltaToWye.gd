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
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		$WarningLabel.text = "Try Again!"
