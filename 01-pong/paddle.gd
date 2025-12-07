extends CharacterBody2D
class_name PaddleBody

@export_range(100, 1000, 1.0) var move_speed: float = 400
var move_dir: float = 0.0

func _init() -> void:
	set_physics_process(true)
	
func _physics_process(delta: float) -> void:
	var _coll = move_and_collide(move_dir*Vector2.UP*move_speed*delta)
