extends Node2D

enum Player {Player1, Player2}
@export var player: Player = Player.Player1

var up_code: String
var down_code: String

func _init() -> void:
	set_process_input(true)
	
func _enter_tree() -> void:
	if player == Player.Player1:
		up_code = "Player1_Up"
		down_code = "Player1_Down"
	else:
		up_code = "Player2_Up"
		down_code = "Player2_Down"
	
func _input(event: InputEvent) -> void:
	var paddle: PaddleBody = get_parent()
	var is_up_p = event.is_action_pressed(up_code)
	var is_up_r = event.is_action_released(up_code)
	var is_dw_p = event.is_action_pressed(down_code)
	var is_dw_r = event.is_action_released(down_code)
	
	if is_up_p:
		paddle.move_dir = 1.0
	elif is_dw_p:
		paddle.move_dir = -1.0
	elif paddle.move_dir > 0 and is_up_r:
		paddle.move_dir = 0.0
	elif paddle.move_dir < 0 and is_dw_r:
		paddle.move_dir = 0.0
	
