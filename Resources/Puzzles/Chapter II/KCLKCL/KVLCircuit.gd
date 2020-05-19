extends Puzzle

export (bool) var solved
var doorPanel
var checker = 0

func _ready():
	_add_items()
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"

func _add_items():
	$PathA/A.add_item("")
	$PathB/B.add_item("")
	$PathC/C.add_item("")
	$PathD/D.add_item("")
	$PathA/A.add_item("Path A")
	$PathA/A.add_item("Path B")
	$PathA/A.add_item("Path C")
	$PathA/A.add_item("Path D")
	$PathB/B.add_item("Path A")
	$PathB/B.add_item("Path B")
	$PathB/B.add_item("Path C")
	$PathB/B.add_item("Path D")
	$PathC/C.add_item("Path A")
	$PathC/C.add_item("Path B")
	$PathC/C.add_item("Path C")
	$PathC/C.add_item("Path D")
	$PathD/D.add_item("Path A")
	$PathD/D.add_item("Path B")
	$PathD/D.add_item("Path C")
	$PathD/D.add_item("Path D")

func _on_A_item_selected(id):
	if id == 1:
		checker += 1

func _on_B_item_selected(id):
	if id == 2:
		checker += 1

func _on_C_item_selected(id):
	if id == 3:
		checker += 1

func _on_D_item_selected(id):
	if id == 4:
		checker += 1


func _on_Submit_pressed():
	if checker == 4:
		$WarningLabel.text = "Youre Correct!"
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		$WarningLabel.text = "Try Again!"
