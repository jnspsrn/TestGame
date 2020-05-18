extends "res://Levels/Level.gd"

onready var reactorRoomDoorPanel =  get_node("Doors/ResearchLabDoor/SideDoorPanel")
onready var crewQuartersDoorPanel = get_node("Doors/CrewQuartersDoor/SideDoorPanel")
onready var armoryDoorPanel = get_node("Doors/ArmoryDoor/SideDoorPanel")
onready var researchLabDoorPanel = get_node("Doors/ResearchLabDoor/SideDoorPanel")
onready var weaponsTechDoorPanel = get_node("Doors/WeaponsTechDoor/SideDoorPanel")
onready var upperEngineDoorPanel = get_node("Doors/UpperEngineDoor/DoorPanel")
onready var lowerEngineDoorPanel = get_node("Doors/LowerEngineDoor/SideDoorPanel")
onready var cc_Waypoint = $CC_Waypoint/CollisionShape2D

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	crewQuartersDoorPanel.connect("is_solved", self, "_on_is_solved")
	armoryDoorPanel.connect("is_solved", self, "_on_is_solved")
	researchLabDoorPanel.connect("is_solved", self, "_on_is_solved")
	weaponsTechDoorPanel.connect("is_solved", self, "_on_is_solved")
	upperEngineDoorPanel.connect("is_solved", self, "_on_is_solved")
	lowerEngineDoorPanel.connect("is_solved", self, "_on_is_solved")
	cc_Waypoint.disabled = true
	
	if not ProgressManager.chapter_1_progress['prompted_dialogue_11']:
		Utils.call_deferred("prompt_dialogue", "ch01_story_dialogue_11.json")
		ProgressManager.chapter_1_progress['prompted_dialogue_11'] = true

func _on_is_solved(object):
	match object:
		crewQuartersDoorPanel:
			if not ProgressManager.chapter_1_progress['is_crew_quarters_door_unlocked']:
				crewQuartersDoorPanel.interaction()
				Utils.prompt_dialogue("ch01_evnt_06_power_door_opened .json")
				ProgressManager.chapter_1_progress['is_crew_quarters_door_unlocked'] = true
		armoryDoorPanel:
			if not ProgressManager.chapter_1_progress['is_armory_door_unlocked']:
				armoryDoorPanel.interaction()
				yield(Utils.prompt_dialogue("ch01_story_dialogue_14.json"), "completed")
				ProgressManager.chapter_1_progress['is_armory_door_unlocked'] = true
				call_deferred("all_doors_unlocked")
		researchLabDoorPanel:
			if not ProgressManager.chapter_1_progress['is_research_lab_door_unlocked']:
				researchLabDoorPanel.interaction()
				yield(Utils.prompt_dialogue("ch01_story_dialogue_13.json"), "completed")
				ProgressManager.chapter_1_progress['is_research_lab_door_unlocked'] = true
				call_deferred("all_doors_unlocked")
		weaponsTechDoorPanel:
			if not ProgressManager.chapter_1_progress['is_weapons_tech_door_unlocked']:
				weaponsTechDoorPanel.interaction()
				yield(Utils.prompt_dialogue("ch01_story_dialogue_12.json"), "completed")
				ProgressManager.chapter_1_progress['is_weapons_tech_door_unlocked'] = true
				call_deferred("all_doors_unlocked")
		upperEngineDoorPanel:
			if not ProgressManager.chapter_1_progress['is_upper_engine_door_unlocked']:
				upperEngineDoorPanel.interaction()
				Utils.prompt_dialogue("ch01_evnt_06_power_door_opened .json")
				ProgressManager.chapter_1_progress['is_upper_engine_door_unlocked'] = true
		lowerEngineDoorPanel:
			if not ProgressManager.chapter_1_progress['is_lower_engine_door_unlocked']:
				lowerEngineDoorPanel.interaction()
				Utils.prompt_dialogue("ch01_evnt_06_power_door_opened .json")
				ProgressManager.chapter_1_progress['is_lower_engine_door_unlocked'] = true

func all_doors_unlocked():
	if (ProgressManager.chapter_1_progress['is_weapons_tech_door_unlocked']
	and ProgressManager.chapter_1_progress['is_research_lab_door_unlocked']
	and ProgressManager.chapter_1_progress['is_armory_door_unlocked']
	):
		Utils.prompt_dialogue("ch01_story_dialogue_15.json")
		reactorRoomDoorPanel.update_puzzle(true)
