extends Node

func _ready():
	call_deferred("initiate")
	VisualServer.set_default_clear_color(Color.black)
	

func initiate():
	print("Initial level: ", GameManager.CurrentLevel.name)
	GameManager.WORLD = self
