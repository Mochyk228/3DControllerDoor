extends CharacterBody3D

signal OnHoverUpdateStart
signal OnHoverUpdateEnd

@export var move_speed : float = 5.0
@export var gravity : float = 15.0
@export var jump_velocity : float = 9.0
@export var mouse_sensitivity : float = 0.5

@onready var head: Node3D = $Head

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	# gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# jump
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity
	
	# move
	var input = Input.get_vector("left", "right", "down", "up")
	var move_dir = Vector3(input.x, 0, -input.y).normalized() # next line only takes normalized
	move_dir = move_dir.rotated(Vector3.UP, rotation.y) # makes y rotation of player effect player's y velocity 
	
	velocity.x = move_dir.x * move_speed
	velocity.z = move_dir.z * move_speed
	
	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity)) # translate mouse position on x to rotation of player
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sensitivity))
		head.rotation_degrees.x = clampf(head.rotation_degrees.x, -80, 80)
