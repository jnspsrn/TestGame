extends CanvasLayer


func _on_ExitButton_pressed():
	self.call_deferred("free")
