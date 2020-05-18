extends Node

var is_new_game : bool

var progress = {
	"Chapter 1" : chapter_1_progress,
	"Chapter 2" : chapter_2_progress
}

var chapter_1_progress
var chapter_2_progress
var chapter_3_progress
var chapter_4_progress
var chapter_6_progress

var chapter_1_conditions

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
	'prompted_dialogue_11' : false,
	'prompted_dialogue_16' : false,
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
	'is_RR_completion_reported' : false,
	'is_powerControl_unlocked' : false,
	'is_power_reported' : false,
	'is_CC_CH01_02_completed' : false,
	'prompted_dialogue_22' : false,
	'is_engineControlOne_unlocked' : false,
	'is_engineControlTwo_unlocked' : false,
	'is_engineControlThree_unlocked' : false,
	'is_engineControlFour_unlocked' : false,
	'is_ER_CH01_completed' : false,
}
	chapter_2_progress = {
		'prompt_dialogue_24' : false,
		'prompt_dialogue_25' : false,
		'prompt_dialogue_26' : false,
		'is_rl_ch01_workbench_completed' : false,
		'prompt_dialogue_27' : false,
		'is_SDS_01_completed' : false,
		'is_SDS_02_completed' : false,
		'is_SDS_03_completed' : false,
		'is_SDS_04_completed' : false,
		'is_a_ch02_completed' : false,
		'prompt_dialogue_29' : false,
		'prompt_dialogue_30' : false,
		'is_WDS_01_completed' : false,
		'is_WDS_02_completed' : false,
		'is_WDS_03_completed' : false,
		'is_WDS_04_completed' : false,
		'is_wtr_ch02_completed' : false,
		'prompt_dialogue_31' : false,
		'prompt_dialogue_32' : false,
		'prompt_dialogue_33' : false,
		'prompt_dialogue_34' : false,
		'is_broken_core_completed' : false,
		'prompt_dialogue_35' : false,
		'prompt_dialogue_36' : false,
	}
	
	chapter_3_progress = {
		'prompt_dialogue_37' : false,
		'prompt_dialogue_38' : false,
		'is_wtr_workbench_completed' : false,
		'prompt_dialogue_39' : false,
		'prompt_dialogue_40' : false,
		'prompt_dialogue_41' : false,
		'prompt_dialogue_42' : false,
		'is_a_workbench_completed' : false,
		'prompt_dialogue_43' : false, 
		'prompt_dialogue_44' : false,
		'is_sj_01_completed' : false,
		'is_sj_02_completed' : false,
		'is_sj_03_completed' : false,
		'is_ds_ch03_completed' : false,
		'prompt_dialogue_46' : false,
		'prompt_dialogue_47' : false,
		'prompt_dialogue_48' : false,
		'prompt_dialogue_49' : false,
		'is_lee_ch03_completed' : false,
		'prompt_dialogue_50' : false,
		'prompt_dialogue_51' : false,
		'prompt_dialogue_52' : false,
		'is_rl_ch03_completed' : false,
		'prompt_dialogue_53' : false,
	}
	
	chapter_4_progress = {
		'prompt_dialogue_54' : false,
		'prompt_dialogue_55' : false,
		'is_rl_ch04_completed' : false,
		'prompt_dialogue_56' : false,
		'prompt_dialogue_57' : false,
		'prompt_dialogue_58' : false,
		'prompt_dialogue_59' : false,
		'prompt_dialogue_60' : false,
		'is_wtr_ch04_completed' : false,
		'prompt_dialogue_61' : false,
		'prompt_dialogue_62' : false,
		'prompt_dialogue_63' : false,
		'is_rl_ch04_02_completed' : false,
		'prompt_dialogue_64' : false,
		'prompt_dialogue_65' : false,
		'prompt_dialogue_66' : false,
		'prompt_dialogue_67' : false,
		'is_wtr_ch04_02_completed' : false,
		'prompt_dialogue_68' : false,
		'prompt_dialogue_69' : false,
		'is_a_ch04_completed' : false,
		'prompt_dialogue_70' : false,
		'prompt_dialogue_71' : false,
		'prompt_dialogue_72' : false,
		'is_rl_ch04_03_completed' : false,
		'prompt_dialogue_73' : false,
		'prompt_dialogue_74' : false,
		'prompt_dialogue_75' : false,
		'is_wtr_ch04_03_completed' : false,
		'prompt_dialogue_76' : false,
		'prompt_dialogue_77' : false,
		'is_engineOne_completed' : false,
		'is_engineTwo_completed' : false,
		'is_engineThree_completed' : false,
		'is_engineFour_completed' : false,
		'is_er_ch04_completed' : false,
		'prompt_dialogue_78' : false,
	}
	
	chapter_6_progress = {
		'prompt_dialogue_79' : false,
		'prompt_dialogue_80' : false,
		'is_rl_ch06_completed' : false,
		'prompt_dialogue_81' : false,
		'prompt_dialogue_82' : false,
	}
	progress = {
	"Chapter 1" : chapter_1_progress,
	"Chapter 2" : chapter_2_progress,
	"Chapter 3" : chapter_3_progress,
	"Chapter 4" : chapter_4_progress,
	"Chapter 6" : chapter_6_progress,
}
	GameManager.GameProgress = progress
	GameManager.PuzzleData = {}
	GameManager.CurrentChapter = "Chapter 1"
	
