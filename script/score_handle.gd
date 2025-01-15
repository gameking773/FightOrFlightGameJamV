extends Control

@onready var player: CharacterBody2D = $"../../../player"

var score = 0

func _process(_delta: float) -> void:
	if player.isMoving:
		score += 1
		self.text = "Score: " + str(score)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("reset-restart"):
		score = 0
