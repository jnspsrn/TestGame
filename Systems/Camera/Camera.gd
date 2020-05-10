extends Camera2D

func _ready():
	GameManager.WorldCamera = self

#func _exit_tree():
#	GameManager.WorldCamera = null
