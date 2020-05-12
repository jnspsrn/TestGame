extends Area2D
class_name EventPrompt

func save_event():
	return {
		"filename" : filename,
		"parent" : get_parent().get_path(),
		"level" : GameManager.CurrentLevel.name,
		"properties" : {
			"position_x" : position.x,
			"position_y" : position.y
		},
	}

func _exit_tree():
	SaveAndLoad.save_prompt_delay()
