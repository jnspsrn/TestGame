extends PuzzleObject

func interaction():
	if ProgressManager.chapter_1_progress['is_RR_CH01_completed']:
		yield(Utils.prompt_dialogue("ch01_story_dialogue_19.json"), "completed")
		if is_puzzle_open == false:
			is_puzzle_open = true
			var PuzzlePath = load(puzzlePath)
			puzzle = PuzzlePath.instance()
			self.add_child(puzzle)
			GameManager.Player.movement_disabled = true
			GameManager.WorldCamera.current = false
			puzzle.puzzleCamera.current = true
		elif is_puzzle_open == true:
			is_puzzle_open = false
			GameManager.Player.movement_disabled = false
			GameManager.WorldCamera.current = true
			emit_signal("closed_puzzle")
			set_interactable()
	else:
		Utils.prompt_dialogue('ch01_story_dialogue_19.json')
