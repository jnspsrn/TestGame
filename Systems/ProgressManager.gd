extends Node

var is_new_game : bool

var progress = {
	"Chapter 1" : chapter_1_progress
}

var chapter_1_progress

var chapter_1_conditions

func _ready():
	pass

#func create_needed_progress():
#	var path = "user://game_data/conditions/chapter_1.save"
#	var directory = Directory.new()
#	if not directory.dir_exists("user://game_data/conditions/"):
#		directory.make_dir_recursive("user://game_data/conditions/")
#	var file = File.new()
#	file.open(path, File.WRITE)
#	file.close()

func load_conditions(loaded_file):
	progress = loaded_file
	chapter_1_progress = progress["Chapter 1"]
	print("progress ", progress)
	print("chapter progress ", chapter_1_progress)

func set_progress_to_default():
	chapter_1_progress  = {
	'is_first_doorpanel_interacted' : false,
	'is_database_unlocked' : false,
	'is_charge_selected' : false,
	'is_entrance_door_opened' : false,
	'is_power_control_door_opened' : false,
	'is_data_center_door_opened' : false,
	'is_ship_square_door_opened' : false,
	'is_CC_CH01_completed' : false,
	'is_crew_quarters_door_unlocked' : false,
	'is_armory_door_unlocked' : false,
	'is_research_lab_door_unlocked' : false,
	'is_weapons_tech_door_unlocked' : false,
	'is_upper_engine_door_unlocked' : false,
	'is_lower_engine_door_unlocked' : false,
	'is_SS_CH01_completed' : false,
	'is_controlPanelOne_unlocked' : false,
	'is_controlPanelTwo_unlocked' : false,
	'is_controlPanelThree_unlocked' : false,
	'is_controlPanelFour_unlocked' : false,
	'is_RR_CH01_completed' : false,
	'is_powerControl_unlocked' : false,
	'is_CC_CH01_02_completed' : false,
	'is_engineControlOne_unlocked' : false,
	'is_engineControlTwo_unlocked' : false,
	'is_engineControlThree_unlocked' : false,
	'is_engineControlFour_unlocked' : false,
	'is_ER_CH01_completed' : false,
}
	progress = {
	"Chapter 1" : chapter_1_progress,
}
	GameManager.GameProgress = progress
	GameManager.PuzzleData = {}
	GameManager.CurrentChapter = "Chapter 1"
	
