extends Control

@onready var player: CharacterBody2D = $"../../../player"

var score = 0

func _process(_delta: float) -> void:
	if player.isMoving:
		score += 1
		self.text = "Score: " + str(score)
