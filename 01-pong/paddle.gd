extends AnimatableBody2D
class_name PaddleBody

@export_range(100, 1000, 1.0) var move_speed: float = 400
var move_dir: float = 0.0
var bound_up: float
var bound_dw: float

func _init() -> void:
	set_physics_process(true)
	
func _enter_tree() -> void:
	var w = $CollisionShape2D.shape.size.y/2.0
	bound_up = %BorderUp.global_position.y+w
	bound_dw = %BorderDown.global_position.y-w
	
func _physics_process(delta: float) -> void:
	var y = global_position.y-delta*move_speed*move_dir
	global_position.y = min(max(y, bound_up), bound_dw)
