extends Puzzle

func _ready():
	pass


func _on_V1_pressed():
	$NodeVoltages/V1/Sprite.visible = not $NodeVoltages/V1/Sprite.visible 
func _on_V2_pressed():
	$NodeVoltages/V2/Sprite.visible = not $NodeVoltages/V2/Sprite.visible 
func _on_V3_pressed():
	$NodeVoltages/V3/Sprite.visible = not $NodeVoltages/V3/Sprite.visible 
	$NodeVoltages/V4/Sprite.visible = not $NodeVoltages/V4/Sprite.visible 
func _on_V4_pressed():
	$NodeVoltages/V4/Sprite.visible = not $NodeVoltages/V4/Sprite.visible 
	$NodeVoltages/V3/Sprite.visible = not $NodeVoltages/V3/Sprite.visible 
