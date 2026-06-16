extends CharacterBody3D

var SPEED = 2

func _physics_process(delta: float) -> void:
	# Add the gravity.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, input_dir.y,0)).normalized()
		
	#Movement stuff
	if direction:
		velocity.x = direction.x * 5
		velocity.y = direction.y * 5
	else:
		velocity.x = move_toward(velocity.x, 0, 0.5)
		velocity.y = move_toward(velocity.y, 0, 0.5)
		
	
	move_and_slide()

func get_speed():
	return SPEED
