extends Node3D

var score : int = 0

signal OnDoorForwardUpdate
signal OnDoorBackwardUpdate

const ROOM_2 : PackedScene = preload("res://Scenes/room2.tscn")
const ROOM_1 : PackedScene = preload("res://Scenes/room1.tscn")

@onready var room_1: Node3D = get_node("/root/Root/Room1")
@onready var room_2: Node3D = get_node("/root/Root/Room2")

var old_position : Vector3
var old_rotation : Vector3

func _ready():
	OnDoorForwardUpdate.connect(forward_room)
	OnDoorBackwardUpdate.connect(backward_room)

func forward_room():
	score += 1
	
	old_position = room_2.global_position
	old_rotation = room_2.rotation
	
	room_2.queue_free()
	room_2 = rand_room().instantiate()
	room_2.global_position = old_position
	room_2.rotation = old_rotation
	add_child(room_2)

func backward_room():
	score += 1
	
	old_position = room_1.global_position
	old_rotation = room_1.rotation
	
	room_1.queue_free()
	room_1 = rand_room().instantiate()
	room_1.global_position = old_position
	room_1.rotation = old_rotation
	add_child(room_1)
	
func rand_room():
	var rooms = [ROOM_1, ROOM_2]
	var rand_num = randi_range(0, 1)
	return rooms[rand_num]
