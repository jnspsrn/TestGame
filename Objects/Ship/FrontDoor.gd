extends Node2D
class_name Door

export(bool) var is_unlocked = true
export(bool) var is_open = false

onready var animationPlayer = $AnimationPlayer
onready var barrier = $Barrier

func check_panel():
	if is_unlocked:
		animationPlayer.play("Idle Unlocked")
	else:
		animationPlayer.play("Idle Locked")

func close_door(body):
	if body is Player:
		animationPlayer.play("Close")
		barrier.remove_collision_exception_with(body)
		is_open = false

func open_door(body):
	if body is Player:
		if is_unlocked and not is_open:
			animationPlayer.play("Open")
			barrier.add_collision_exception_with(body)
			is_open = true

func lock_door():
	animationPlayer.play("Idle Locked")
	is_unlocked = false

func unlock_door():
	animationPlayer.play("Idle Unlocked")
	is_unlocked = true

func _on_Sensor_body_entered(body):
	if body is Player:
		print("Plaayer")
	if is_unlocked:
		open_door(body)

func _on_Sensor_body_exited(body):
	if is_open:
		close_door(body)
