extends Node

const max_score: int = 5
enum Player {Player1, Player2}
var score: Dictionary[Player, int] = {
	Player.Player1: 0,
	Player.Player2: 0
}
signal  score_updated

func reset_score():
	score[Player.Player1] = 0
	score[Player.Player2] = 0
	score_updated.emit(score)

func update_score(player: Player):
	var new_score = score[player] + 1
	score[player] = new_score
	score_updated.emit(score)
	if new_score == max_score:
		declare_win(player)
		
func declare_win(player: Player) -> void:
	print("Player ", player, " wins")
	reset_score()
