extends "res://Levels/Chapter IV/SS_CH04.gd"

onready var rl_ch04 = $RL_CH04/CollisionShape2D
onready var rl_ch04_03 = $RL_CH04_03/CollisionShape2D
onready var wtr_ch04_02 = $WTR_CH04_02/CollisionShape2D
onready var wtr_ch04_03 = $WTR_CH04_03/CollisionShape2D

func _ready():
	var parent = get_parent()
	if parent is WORLD:
		GameManager.CurrentLevel = self
	Utils.call_deferred("set_current_level_puzzles")
	if ProgressManager.chapter_4_progress['is_a_ch04_completed'] and ProgressManager.chapter_4_progress['prompt_dialogue_71']:
		rl_ch04.disabled = true
		rl_ch04_03.disabled = false
	if ProgressManager.chapter_4_progress['is_rl_ch04_03_completed'] and ProgressManager.chapter_4_progress['prompt_dialogue_74']:
		wtr_ch04_02.disabled = true
		wtr_ch04_03.disabled = false
		
