extends Node

func _ready():
	call_deferred("set_initial_level")
	VisualServer.set_default_clear_color(Color.black)

func set_initial_level():
	print("Initial level: ", GameManager.CurrentLevel.name)
