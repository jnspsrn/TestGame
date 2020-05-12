extends Puzzle

export(bool) var solved = false
export(bool) var playerAnswer = null

onready var promptTimer = $PromptTimer
onready var trueButton = $True
onready var falseButton = $False

var correctAnswer = true
var doorPanel

func _ready():
	doorPanel = get_parent()
	if not ProgressManager.chapter_1_progress["is_first_doorpanel_interacted"]:
		promptTimer.start()
		trueButton.hide()
		falseButton.hide()

func _physics_process(_delta):
	if not ProgressManager.chapter_1_progress["is_first_doorpanel_interacted"]:
		if promptTimer.time_left == 0:
			self.queue_free()

func _exit_tree():
	GameManager.WorldCamera.current = true
	GameManager.UI.databaseButton.show()
	if not ProgressManager.chapter_1_progress["is_first_doorpanel_interacted"]:
		Utils.prompt_dialogue("ch01_evnt_02.json")
		ProgressManager.chapter_1_progress["is_first_doorpanel_interacted"] = true
	if ProgressManager.chapter_1_progress["is_entrance_door_opened"] and solved:
		Utils.prompt_dialogue("ch01_evnt_05_door_opened.json")

func _on_True_pressed():
	playerAnswer = true
	verify(playerAnswer)

func _on_False_pressed():
	playerAnswer = false
	verify(playerAnswer)

func verify(answer):
	if correctAnswer == answer and not ProgressManager.chapter_1_progress["is_entrance_door_opened"]:
		solved = true
		print("You are correct!")
		doorPanel.interactable = false
		doorPanel.update_puzzle(solved)
		self.queue_free()
	else:
		solved = false
		print("Try again!")
