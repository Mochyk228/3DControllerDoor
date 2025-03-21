extends Node3D

@export var player: CharacterBody3D
var is_open : bool
var is_forwad : bool
var is_backward : bool

@onready var camera_3d: Camera3D = $Camera3D
@onready var ray_cast_3d: RayCast3D = $RayCast3D

func _physics_process(delta):
	var object = ray_cast_3d.get_collider() # get object from collider
	if ray_cast_3d.is_colliding() and object.is_in_group("Door"):
		player.OnHoverUpdateStart.emit()
		var vec = (object.global_position - player.global_position).normalized()
		if Input.is_action_just_pressed("interact") and not object.get_child(0).is_playing():
			if not is_open:
				if vec.z > 0:
					object.get_child(0).play("open_door_back")
					is_open = true
					is_backward = true
				else:
					object.get_child(0).play("open_door")
					is_open = true
					is_forwad = true
			else:
				if is_backward:
					object.get_child(0).play("close_door_back")
					is_open = false
					is_backward = false
				else:
					object.get_child(0).play("close_door")
					is_open = false
					is_forwad = false
	else:
		player.OnHoverUpdateEnd.emit()
