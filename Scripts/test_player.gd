extends CharacterBody3D

var main = preload("res://Main World/racetracks.tscn")
var SPEED
const JUMP_VELOCITY = 5.0
var canInteract = false
signal playerPresent(player: CharacterBody3D)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite3D.play("jump")
			
	if Input.is_action_pressed("Sprint"):
		SPEED = 10.0
	else:
		SPEED = 6.0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	#When the input direction vector length is greater than 0 (i.e. the player is moving) then match their sprite to the direction of movement.
	if (input_dir.length()>0 && is_on_floor()):
		match(rad_to_deg(atan2(input_dir.y,input_dir.x))):
			0.0:
				$AnimatedSprite3D.play("right")
				
				
			180.0:
				$AnimatedSprite3D.play("left")
				
			45.0:
				$AnimatedSprite3D.play("down-right")
				
			90.0:
				$AnimatedSprite3D.play("down")
				
			135.0:
				$AnimatedSprite3D.play("down-left")
				
			-45.0:
				$AnimatedSprite3D.play("up-right")
				
			-90.0:
				$AnimatedSprite3D.play("up")
				
			-135.0:
				$AnimatedSprite3D.play("up-left")
			_:
				print(rad_to_deg(atan2(input_dir.y,input_dir.x)))
	
	#Did the player just jump?
	elif(not is_on_floor() && self.velocity.y > 0):
		$AnimatedSprite3D.animation = "Air_upwards"
		match(rad_to_deg(atan2(input_dir.y,input_dir.x))):
			0.0:
				$AnimatedSprite3D.set_frame(0)
				
			180.0:
				$AnimatedSprite3D.set_frame(1)
				
			45.0:
				$AnimatedSprite3D.set_frame(2)
				
			90.0:
				$AnimatedSprite3D.set_frame(3)
				
			135.0:
				$AnimatedSprite3D.set_frame(4)
				
			-45.0:
				$AnimatedSprite3D.set_frame(5)
				
			-90.0:
				$AnimatedSprite3D.set_frame(6)
				
			-135.0:
				$AnimatedSprite3D.set_frame(7)
			_:
				print(rad_to_deg(atan2(input_dir.y,input_dir.x)))
	
	#Is the player falling?
	elif(not is_on_floor() && self.velocity.y <= 0):
		$AnimatedSprite3D.animation = "Air_downwards"
		match(rad_to_deg(atan2(input_dir.y,input_dir.x))):
			0.0:
				$AnimatedSprite3D.set_frame(0)
				
			180.0:
				$AnimatedSprite3D.set_frame(1)
				
			45.0:
				$AnimatedSprite3D.set_frame(2)
				
			90.0:
				$AnimatedSprite3D.set_frame(3)
				
			135.0:
				$AnimatedSprite3D.set_frame(4)
				
			-45.0:
				$AnimatedSprite3D.set_frame(5)
				
			-90.0:
				$AnimatedSprite3D.set_frame(6)
				
			-135.0:
				$AnimatedSprite3D.set_frame(7)
			_:
				print(rad_to_deg(atan2(input_dir.y,input_dir.x)))
	
	else:
		#Is the player stationary?
		if(self.velocity.length() == 0): 
			$AnimatedSprite3D.animation = "down"
			$AnimatedSprite3D.set_frame_and_progress(0,0)
	
	#Movement stuff
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 0.5)
		velocity.z = move_toward(velocity.z, 0, 0.5)
		
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	
	if event.is_action("Interact") && canInteract:
		playerPresent.emit(self)

func _on_interactable_test_object_body_entered(body: Node3D) -> void:
	canInteract = true


func _on_interactable_test_object_body_exited(body: Node3D) -> void:
	canInteract = false
	pass # Replace with function body.
