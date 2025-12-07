extends AnimatableBody2D
class_name PaddleBody

@export_range(100, 1000, 1.0) var move_speed: float = 400
@export_range(0, 100.0, 0.1) var vel_edge_bonus: float = 50.0
var move_dir: float = 0.0
var bound_up: float
var bound_dw: float
var height: float

func _init() -> void:
	set_physics_process(true)
	
func _enter_tree() -> void:
	var cshape = $CollisionShape2D.shape
	height = cshape.b.y-cshape.a.y
	bound_up = %BorderUp.global_position.y-cshape.a.y
	bound_dw = %BorderDown.global_position.y-cshape.b.y
	
func _physics_process(delta: float) -> void:
	var y = global_position.y-delta*move_speed*move_dir
	global_position.y = min(max(y, bound_up), bound_dw)

func get_bounce_velocity(v0: Vector2, cpos: Vector2) -> Vector2:
	# Get the velocity outside of a bounce. Cpos is the collision position
	# in global coordinates
	var dy = (cpos.y-global_position.y)	
	return Vector2(-v0.x, v0.y+2.0*dy/height*vel_edge_bonus)
