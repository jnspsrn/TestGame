extends CanvasLayer


onready var currentLevelLabel = $CurrentLevelLabel
onready var databaseButton = $DatabaseButton
onready var database = $Database
onready var dialogueBox = get_node("Dialogue/DialogueBox")

func _ready():
	call_deferred("set_UI")

func _on_Changed_Chapter():
	currentLevelLabel.text = GameManager.CurrentLevel.name

func _on_Changed_Level():
	currentLevelLabel.text = GameManager.CurrentLevel.name
	
func set_UI():
	if not ProgressManager.chapter_1_progress["is_database_unlocked"]:
		databaseButton.hide()
	GameManager.UI = self
# warning-ignore:return_value_discarded
	GameManager.connect("changed_level", self, "_on_Changed_Level")
# warning-ignore:return_value_discarded
	Utils.connect("changed_chapter", self, "_on_Changed_Chapter")
	currentLevelLabel.text = GameManager.CurrentLevel.name
	
func play_dialogue(data):
	dialogueBox.start(data)
	yield(dialogueBox, "dialogue_ended")
	
func _on_DatabaseButton_pressed():
	database.opened = true
	databaseButton.hide()
	if not ProgressManager.chapter_1_progress["is_database_unlocked"]:
		Utils.prompt_dialogue("ch01_story_dialogue_05.json")
		ProgressManager.chapter_1_progress["is_database_unlocked"] = true

func _on_ExitDatabase_pressed():
	database.opened = false
	databaseButton.show()
