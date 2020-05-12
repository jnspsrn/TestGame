extends PuzzleObject

func update_puzzle(update):
	puzzle_solved = update
	if puzzle_solved:
		print("Updated puzzle to: ", puzzle_solved)
		SaveAndLoad.save_puzzle(self, get_level())
		emit_signal("is_solved", self)
#		self.interaction()


