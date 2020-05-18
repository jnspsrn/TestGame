extends PuzzleObject

func interaction():
	if not ProgressManager.chapter_3_progress['prompt_dialogue_49']:
		yield(Utils.prompt_dialogue("ch03_story_dialogue_49.json"), "completed")
		ProgressManager.chapter_3_progress['prompt_dialogue_49'] = true
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
