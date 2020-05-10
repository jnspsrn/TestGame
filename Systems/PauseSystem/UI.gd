extends CanvasLayer


onready var currentLevelLabel = $CurrentLevelLabel

func _ready():
	call_deferred("set_UI")

func _on_Changed_Level():
	currentLevelLabel.text = GameManager.CurrentLevel.name
	
func set_UI():
	GameManager.connect("changed_level", self, "_on_Changed_Level")
	currentLevelLabel.text = GameManager.CurrentLevel.name
