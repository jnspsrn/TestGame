extends Puzzle


export (bool) var solved
var doorPanel
var NodeA = ["i1", "i4", "i2", "i5"]
var NodeB = ["i2", "i3", "i4", "ib", "ia"]
var NodeC = ["ib", "i3", "i4", "ic"]
var NodeD = ["i5", "ia", "ic"]
var checker = 0

func _ready():
	doorPanel = get_parent()
	if doorPanel.puzzle_solved:
		solved = true
		$WarningLabel.visible = true
		$WarningLabel.text = "Already solved!"

func _on_A1_text_entered(new_text):
	if new_text == NodeA[0]:
		checker +=1
func _on_A2_text_entered(new_text):
	if new_text == NodeA[1]:
		checker +=1
func _on_A3_text_entered(new_text):
	if new_text == NodeA[2]:
		checker +=1
func _on_A4_text_entered(new_text):
	if new_text == NodeA[3]:
		checker +=1

func _on_B1_text_entered(new_text):
	if new_text == NodeB[0]:
		checker +=1
func _on_B2_text_entered(new_text):
	if new_text == NodeB[1]:
		checker +=1
func _on_B3_text_entered(new_text):
	if new_text == NodeB[2]:
		checker +=1
func _on_B4_text_entered(new_text):
	if new_text == NodeB[3]:
		checker +=1
func _on_B5_text_entered(new_text):
	if new_text == NodeB[4]:
		checker +=1

func _on_C1_text_entered(new_text):
	if new_text == NodeC[0]:
		checker +=1
func _on_C2_text_entered(new_text):
	if new_text == NodeC[1]:
		checker +=1
func _on_C3_text_entered(new_text):
	if new_text == NodeC[2]:
		checker +=1
func _on_C4_text_entered(new_text):
	if new_text == NodeC[3]:
		checker +=1

func _on_D1_text_entered(new_text):
	if new_text == NodeD[0]:
		checker +=1
func _on_D2_text_entered(new_text):
	if new_text == NodeD[1]:
		checker +=1
func _on_D3_text_entered(new_text):
	if new_text == NodeD[2]:
		checker +=1


func _on_Submit_pressed():
	if checker == 16:
		$WarningLabel.text = "You are correct!"
		solved = true
		doorPanel.update_puzzle(solved)
	else:
		$WarningLabel.text = "Try Again!"











