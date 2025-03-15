extends Control

@export var player: CharacterBody3D
@onready var on_hover: Control = $OnHover

func _ready():
	player.OnHoverUpdateStart.connect(hover_over_start)
	player.OnHoverUpdateEnd.connect(hover_over_end)

func hover_over_start():
	on_hover.visible = true

func hover_over_end():
	on_hover.visible = false
