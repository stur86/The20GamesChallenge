extends Label

func _enter_tree() -> void:
	# Subscribe to the signal
	Referee.score_updated.connect(update_score)

func _exit_tree() -> void:
	Referee.score_updated.disconnect(update_score)
	
func update_score(score: Dictionary[Referee.Player, int]) -> void:
	text = str(score[Referee.Player.Player1]) + " | " + str(score[Referee.Player.Player2])
