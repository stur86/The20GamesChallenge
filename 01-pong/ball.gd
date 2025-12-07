extends CharacterBody2D

@export var speed = 500.0
@export_range(0.0, 90.0, 0.1, "degrees") var start_angle_spread = 20.0

func _init() -> void:
	set_physics_process(true)
	reset()

func reset() -> void:
	# Set to the centre of the world
	global_position = Vector2.ZERO
	# Pick a direction at random
	var x_dir = sign(randf()-0.5)
	# Now pick an angle at random
	var angle = deg_to_rad(randf_range(-start_angle_spread, start_angle_spread))
	# Now set the velocity
	velocity = Vector2(cos(angle)*x_dir, sin(angle))*speed
	
func _physics_process(delta: float) -> void:
	# Move in the given direction
	var planned_motion = velocity*delta
	var coll = move_and_collide(planned_motion, false, 0.05)
	if coll != null:
		# Get the collider
		var obj = coll.get_collider()
		if obj is PaddleBody:
			velocity = obj.get_bounce_velocity(velocity, coll.get_position())
		else:
			# Must be up or down edge
			velocity = Vector2(velocity.x, -velocity.y)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# We're out of the screen, reset
	reset()
