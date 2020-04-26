extends Button

const Trailer = preload("res://Resources/Videos/Trailer.tscn")

func play_trailer():
	var trailer = Trailer.instance()
	get_tree().current_scene.add_child(trailer)
	trailer.play()

func _on_play_button_pressed():
	play_trailer()
