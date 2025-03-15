extends CharacterBody3D

@export var move_speed : float = 5

func _physics_process(delta):
	# gravity
	
	# jump
	
	# move
	var input = Input.get_vector("left", "right", "down", "up")
	velocity.x = input.x * move_speed
	velocity.z = -input.y * move_speed
	
	move_and_slide()
