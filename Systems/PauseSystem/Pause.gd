extends Control

var paused = false setget set_paused

func set_paused(value):
	paused = value
	get_tree().paused = paused
	visible = paused

func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		self.paused = !paused

func _on_ResumeButton_pressed():
	self.paused = false

func _on_SaveButton_pressed():
	SaveAndLoad.save_game()
	print("Game saved!")

func _on_LoadButton_pressed():
	self.paused = false
	ProgressManager.is_new_game = false
	GameManager.change_state(GameManager.GAME_STATE.LOADING)

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_MainMenuButton_pressed():
	self.paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Systems/UI/StartMenu.tscn")
