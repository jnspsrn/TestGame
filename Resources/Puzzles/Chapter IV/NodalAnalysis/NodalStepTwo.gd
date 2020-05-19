extends Puzzle

export (bool) var solved
var NodeV1 = false
var NodeV2 = false
var V1 = false
var V2 = false
var puzzleObject


func _ready():
	puzzleObject = get_parent()
	$Submit.visible = false
	$V1.visible = false
	$V2.visible = false
	_add_items()


func _add_items():
	$Equation/NodeV1.add_item("")
	$Equation/NodeV1.add_item("Node v1")
	$Equation/NodeV1.add_item("Node v2")
	$Equation/NodeV2.add_item("")
	$Equation/NodeV2.add_item("Node v1")
	$Equation/NodeV2.add_item("Node v2")

func _on_NodeV1_item_selected(id):
	if id == 1:
		NodeV1 = true
		_node_checker()

func _on_NodeV2_item_selected(id):
	if id == 2:
		NodeV2 = true
		_node_checker()

func _node_checker():
	if NodeV1 == true and NodeV2 == true:
		$Submit.visible = true
		$V1.visible = true
		$V2.visible = true
		$InstructionLabel.text = "Correct! Now calculate v1 and v2."
	else: 
		pass

func _on_V1Answer_text_entered(new_text):
	if new_text == "9.09":
		V1 = true


func _on_V2Answer_text_entered(new_text):
	if new_text == "10.91":
		V2 = true

func _on_Submit_pressed():
	if V1 == true and V2 == true:
		puzzleObject.update_puzzle(true)
		$WarningLabel.text = "You are Correct!"
	else:
		$WarningLabel.text = "Try Again!"
