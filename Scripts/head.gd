extends Node3D

@export var player: CharacterBody3D
var is_open : bool

@onready var camera_3d: Camera3D = $Camera3D
@onready var ray_cast_3d: RayCast3D = $RayCast3D

func _physics_process(delta):
	var object = ray_cast_3d.get_collider() # get object from collider
	if ray_cast_3d.is_colliding() and object.is_in_group("Door"):
		player.OnHoverUpdateStart.emit()
		if Input.is_action_just_pressed("interact"):
			if not is_open:
				object.get_child(0).play("open_door")
				is_open = true
			else:
				object.get_child(0).play("close_door")
				is_open = false
	else:
		player.OnHoverUpdateEnd.emit()
