extends Node

onready var WindowCamera = $WindowCamera

func _ready():
	WindowCamera.current = true



func _on_save_pressed():
	SaveAndLoad.save_puzzles()

func _on_load_pressed():
	pass
