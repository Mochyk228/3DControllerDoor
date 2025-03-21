extends Control

@export var player: CharacterBody3D
@onready var on_hover: Control = $OnHover
@onready var score: Label = $Score

func _ready():
	player.OnHoverUpdateStart.connect(hover_over_start)
	player.OnHoverUpdateEnd.connect(hover_over_end)
	
	GameManager.OnDoorBackwardUpdate.connect(update_score)
	GameManager.OnDoorForwardUpdate.connect(update_score)

func update_score():
	score.text = str("Score: ", GameManager.score)

func hover_over_start():
	on_hover.visible = true

func hover_over_end():
	on_hover.visible = false
