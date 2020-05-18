extends Control


var opened = false setget set_opened

func set_opened(value):
	opened = value
	visible = opened

func _on_Charge_pressed():
	if not ProgressManager.chapter_1_progress["is_charge_selected"]:
		yield(Utils.prompt_dialogue("ch01_story_dialogue_06.json"), "completed")
		ProgressManager.chapter_1_progress["is_charge_selected"] = true
	var TestCharge = load("res://TestCharge.tscn")
	var testCharge = TestCharge.instance()
	self.add_child(testCharge)
