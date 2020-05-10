extends Area2D


func _ready():
	pass


func _on_EventPrompt_body_entered(body):
	ProgressManager.compare_progress()
