extends VideoPlayer

func _on_Trailer_finished():
	self.queue_free()


func _on_Tahp_Button_pressed():
	self.queue_free()
