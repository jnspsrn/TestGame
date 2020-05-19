extends Puzzle

var Seven = false
var Five = false 
var Loop1 = false
var Loop2 = false
var Loop3 = false
var puzzleObject
 
func _ready():
	puzzleObject = get_parent()
	pass 

func _on_Seven_text_entered(new_text):
	if new_text == "7":
		Seven = true
		_first_checker()

func _on_Five_text_entered(new_text):
	if new_text == "5":
		Five = true
		_first_checker()

func _first_checker():
	if Seven == true and Five == true:
		$Loop.visible = true
		$Loop2.visible = true
		$Loop3.visible = true
		$Submit.visible = true
		$Branches.visible = false
		$Nodes.visible = false
		$InstructionLabel.text = "That means there are 3 meshes, assign them."

func _on_Loop_area_entered(area):
	if area is MeshCircuit:
		Loop1 = true
func _on_Loop_area_exited(area):
	if area is MeshCircuit:
		Loop1 = false

func _on_Loop2_area_entered(area):
	if area is MeshCircuit:
		Loop2 = true
func _on_Loop2_area_exited(area):
	if area is MeshCircuit:
		Loop2 = false

func _on_Loop3_area_entered(area):
	if area is MeshCircuit:
		Loop3 = true
func _on_Loop3_area_exited(area):
	if area is MeshCircuit:
		Loop3 = false



func _on_Submit_pressed():
	if Loop1 == true and Loop2 == true and Loop3 == true :
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You Are Correct!"
	else: 
		$WarningLabel.text = "Try Again!"
