extends "res://Levels/Level.gd"

onready var powerControlDoorPanel =  get_node("PowerControlDoor/DoorPanel")
onready var dataCenterDoorPanel = get_node("DataCenterDoor/DoorPanel")
onready var shipSquareDoorPanel = get_node("ShipSquareDoor/DoorPanel")
onready var entranceDoorPanel = get_node("EntranceDoor/SideDoorPanel")


func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	entranceDoorPanel.connect("entrance_door_unlocked", self, "_on_entrance_door_unlocked")
	dataCenterDoorPanel.connect("data_center_door_unlocked", self, "_on_data_center_door_unlocked")
	shipSquareDoorPanel.connect("ship_square_door_unlocked", self, "_on_ship_square_door_unlocked")
	powerControlDoorPanel.connect("power_control_door_unlocked", self, "_on_power_control_door_unlocked")

func _on_power_control_door_unlocked():
	if not ProgressManager.chapter_1_progress['is_power_control_door_opened']:
		powerControlDoorPanel.interaction()
		Utils.prompt_dialogue("ch01_evnt_06_power_door_opened .json")
		ProgressManager.chapter_1_progress['is_power_control_door_opened'] = true

func _on_data_center_door_unlocked():
	if not ProgressManager.chapter_1_progress['is_data_center_door_opened']:
		dataCenterDoorPanel.interaction()
		ProgressManager.chapter_1_progress['is_data_center_door_opened'] = true
		Utils.prompt_dialogue("ch01_evnt_07_datacenter_door_opened.json")	

func _on_ship_square_door_unlocked():
	if not ProgressManager.chapter_1_progress['is_ship_square_door_opened']:
		shipSquareDoorPanel.interaction()
		ProgressManager.chapter_1_progress['is_ship_square_door_opened'] = true
		ProgressManager.chapter_1_progress['is_CC_CH01_completed'] = true
		Utils.prompt_dialogue("ch01_evnt_08_shipsquare_door_opened.json")
		SaveAndLoad.save_game()

func _on_entrance_door_unlocked():
	ProgressManager.chapter_1_progress['is_entrance_door_opened'] = true
	print("Entrance Door Unlocked!")
