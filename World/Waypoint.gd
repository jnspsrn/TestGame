extends Node

export(Resource) var connection = null
export(String, FILE, "*.tscn") var new_level_path = ""
var active = true

func _on_Waypoint_body_entered(body):
	if body is Player:
		GameManager.door_hit(self)
