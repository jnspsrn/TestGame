extends "res://Levels/Level.gd"

onready var shipSquareDoorPanel = $ShipSquareDoor/DoorPanel
onready var entranceDoorPanel = $EntranceDoor/SideDoorPanel
onready var dataCenterDoorPanel = $DataCenterDoor/DoorPanel
onready var powerControlDoorPanel = $PowerControlDoor/DoorPanel
onready var powerControl = $PowerController
onready var ss_Waypoint = $SS_Waypoint/CollisionShape2D

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
#	if ProgressManager.chapter_1_progress['is_CC_CH01_completed']:
#		for doorPanel in get_tree().get_nodes_in_group("DoorPanel"):
#			doorPanel.interactable = false
#			doorPanel.update_puzzle(true)
	powerControl.connect("is_solved", self, "_on_is_solved")
	ss_Waypoint.disabled = true

func _on_is_solved(object):
	match object:
		powerControl:
			if not ProgressManager.chapter_1_progress['is_powerControl_unlocked']:
				powerControl.interaction()
				Utils.prompt_dialogue("ch01_story_dialogue_20.json")
				ProgressManager.chapter_1_progress['is_powerControl_unlocked'] = true
