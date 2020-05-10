extends Control


func _on_NewGameButton_pressed():
	GameManager.change_state(GameManager.GAME_STATE.NEW_GAME)

func _on_LoadButton_pressed():
	ProgressManager.is_new_game = false
	GameManager.change_state(GameManager.GAME_STATE.LOADING)

func _on_QuitButton_pressed():
	get_tree().quit()
