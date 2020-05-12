extends Control
class_name DialogueBox

signal dialogue_ended

onready var dialogue_player: DialoguePlayer = get_node("DialoguePlayer")

onready var name_label := get_node("Panel/Columns/Name") as Label
onready var text_label := get_node("Panel/Columns/Text") as Label

onready var button_next := get_node("Panel/Columns/NextButton") as Button
onready var button_finished := get_node("Panel/Columns/DoneButton") as Button

onready var portrait := get_node("Portrait") as TextureRect


func start(dialogue: Dictionary) -> void:
	# Reinitializes the UI and asks the DialoguePlayer to 
	# play the dialogue
	button_finished.hide()
	button_next.show()
	button_next.grab_focus()
	button_next.text = "Next"
	dialogue_player.start(dialogue)
	update_content()
	show()



func _on_DialoguePlayer_finished() -> void:
	button_next.hide()
	button_finished.grab_focus()
	button_finished.show()


func update_content() -> void:
	var dialogue_player_name = dialogue_player.title
	name_label.text = dialogue_player_name
	text_label.text = dialogue_player.text
	portrait.texture = DialogueDatabase.get_texture(
		dialogue_player_name, dialogue_player.expression
	)


func _on_NextButton_pressed():
	dialogue_player.next()
	update_content()


func _on_DoneButton_pressed():
	emit_signal("dialogue_ended")
	hide()
