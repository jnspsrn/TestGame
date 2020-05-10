extends Node

var Player = null
var WorldCamera = null
var CurrentLevel = null
var GameProgress = null
var CurrentChapter = null
var PuzzleData = null
var state = GAME_STATE.MAIN_MENU

const startMenu = "res://Systems/UI/StartMenu.tscn"

enum GAME_STATE {
	NEW_GAME,
	MAIN_MENU,
	IN_GAME,
	SAVING,
	LOADING,
}

signal changed_level

func _ready():
	change_state(state)

func change_state(game_state):
	match game_state:
		GAME_STATE.NEW_GAME:
			state = GAME_STATE.NEW_GAME
			ProgressManager.is_new_game = true
			ProgressManager.set_progress_to_default()
			change_state(GAME_STATE.IN_GAME)
		GAME_STATE.MAIN_MENU:
			state = GAME_STATE.MAIN_MENU
# warning-ignore:return_value_discarded
			get_tree().change_scene(startMenu)
		GAME_STATE.IN_GAME:
			state = GAME_STATE.IN_GAME
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://World/World.tscn")
		GAME_STATE.LOADING:
			state = GAME_STATE.LOADING
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://World/World.tscn")
			call_deferred("load_data")
		GAME_STATE.SAVING:
			state = GAME_STATE.SAVING
			pass

func save_data():
	return {
		"Player" : {
			"filename" : Player.filename,
			"parent" : Player.get_parent().get_path(),
			"properties" : {
				"position_x" : Player.position.x,
				"position_y" : Player.position.y,
			}
		},
		
		"WorldCamera" : {
			"filename" : WorldCamera.filename,
			"parent" : WorldCamera.get_parent().get_path(),
			"properties" : {
				"position_x" : WorldCamera.position.x,
				"position_y" : WorldCamera.position.y,
				"current" : WorldCamera.current,
			}
			
		},
		
		"CurrentLevel" : {
			"filename" : CurrentLevel.filename,
			"parent" : CurrentLevel.get_parent().get_path(),
			"properties" : {
				"position_x" : CurrentLevel.position.x,
				"position_y" : CurrentLevel.position.y,
			}
		},
		
		"GameProgress" : GameProgress,
		
		"CurrentChapter" : CurrentChapter,
		
		"PuzzleData" : PuzzleData
	}

func load_data():
	SaveAndLoad.load_game()

func change_levels(door):
	var offset = GameManager.CurrentLevel.position
	GameManager.CurrentLevel.queue_free()
	var NewLevel = load(door.new_level_path)
	var newLevel = NewLevel.instance()
	get_node("/root/World").add_child(newLevel)
	var newDoor = get_door_with_connection(door, door.connection)
	var exit_position = newDoor.position - offset
	newLevel.position = door.position - exit_position
	print("Entered ", GameManager.CurrentLevel.name)
	self.emit_signal("changed_level")

func get_door_with_connection(notDoor, connection):
	var doors = get_tree().get_nodes_in_group("Door")
	for door in doors:
		if door.connection == connection and door != notDoor:
			return door
	return null

func door_hit(door):
	print("door hit")
	call_deferred("change_levels", door)
