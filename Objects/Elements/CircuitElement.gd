extends Area2D
class_name CircuitElement

var dragMouse = false
var velocity = Vector2()
var rotation_dir = 0
var numberofElements = 0

export (int) var speed = 200
export (float) var rotation_speed = 1.5

func _ready():
	pass

func _process(delta):
	rotation_dir = 61.5
	velocity = Vector2()
	if Input.is_action_just_pressed("Release"):
		dragMouse = false
	if(dragMouse):
		set_position(get_viewport().get_mouse_position())
		if Input.is_action_just_pressed('Turn'):
			rotation_degrees  += 30

func _on_Button_pressed():
	dragMouse = true
