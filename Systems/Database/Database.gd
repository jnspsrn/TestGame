extends Control


var opened = false setget set_opened

func set_opened(value):
	opened = value
	visible = opened

func _on_Charge_pressed():
	if not ProgressManager.chapter_1_progress["is_charge_selected"]:
		yield(Utils.prompt_dialogue("ch01_evnt_04_charge_tutorial.json"), "completed")
		ProgressManager.chapter_1_progress["is_charge_selected"] = true
