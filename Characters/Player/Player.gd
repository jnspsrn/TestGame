extends KinematicBody2D
class_name Player

const ACCELERATION = 800
const MAX_SPEED = 128
const FRICTION = 750

var velocity = Vector2.ZERO
var movement_disabled = false

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var cameraFollow = $PlayerCameraFollow

signal interact_with_object #emitted when player interacts with an InteractableObject
# warning-ignore:unused_signal
signal hit_door(door)

func _ready():
	GameManager.Player = self
	animationTree.active = true
	call_deferred("assign_world_camera")

func _physics_process(delta):
	interact()
	if movement_disabled == false:
		move(delta)

# function for Player movement
func move(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() # This normalizes input_vector to unity. This allows diagonal motion to have the same speed as vertical and horizontal motion.
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
# warning-ignore:return_value_discarded
	velocity = move_and_slide(velocity)

func interact():
	if Input.is_action_just_pressed("Interact"):
		emit_signal("interact_with_object")

func save():
	return {
		"filename": filename,
		"parent": get_parent().get_path(),
		"position_x" : position.x,
		"position_y" : position.y,
	}

func assign_world_camera():
	cameraFollow.remote_path = GameManager.WorldCamera.get_path()
