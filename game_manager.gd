extends Node3D

const ROOM_2 = preload("res://Scenes/room2.tscn")
@onready var room_2: Node3D = $Room2

func _ready():
	room_2 = ROOM_2.instantiate()
	room_2.queue_free()
