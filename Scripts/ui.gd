extends Control

var target_scores : Array = [5, 25, 100, 500]

@export var door: CSGBox3D
@export var player: CharacterBody3D
@onready var on_hover: Control = $OnHover
@onready var score: Label = $Score
@onready var slots: Panel = $Slots

const SECOND_MAT = preload("res://Materials/second_mat.tres")
const THIRD_MAT = preload("res://Materials/third_mat.tres")
const FORTH_MAT = preload("res://Materials/forth_mat.tres")
const FIFTH_MAT = preload("res://Materials/fifth_mat.tres")



func _ready():
	player.OnHoverUpdateStart.connect(hover_over_start)
	player.OnHoverUpdateEnd.connect(hover_over_end)
	
	GameManager.OnDoorBackwardUpdate.connect(update_score)
	GameManager.OnDoorForwardUpdate.connect(update_score)

func update_score():
	score.text = str("Score: ", GameManager.score)
	
	var i = 0
	if GameManager.score >= target_scores[i]:
		i += 1
		slots.visible = true
		GameManager.is_shopping = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func hover_over_start():
	on_hover.visible = true

func hover_over_end():
	on_hover.visible = false

func _on_button_1_pressed() -> void:
	if GameManager.score >= 5:
		GameManager.score -= 5
		door.material = SECOND_MAT
		$Slots/Slot1.visible = false
		slots.visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		update_score()
		GameManager.is_shopping = false

func _on_button_2_pressed() -> void:
	if GameManager.score >= 25:
		GameManager.score -= 25
		door.material = THIRD_MAT
		$Slots/Slot2.visible = false
		slots.visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		update_score()
		GameManager.is_shopping = false

func _on_button_3_pressed() -> void:
	if GameManager.score >= 100:
		GameManager.score -= 100
		door.material = FORTH_MAT
		$Slots/Slot3.visible = false
		slots.visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		update_score()
		GameManager.is_shopping = false

func _on_button_4_pressed() -> void:
	if GameManager.score >= 500:
		GameManager.score -= 500
		door.material = FIFTH_MAT
		$Slots/Slot4.visible = false
		slots.visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		update_score()
		GameManager.is_shopping = false
