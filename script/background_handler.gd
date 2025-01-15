extends Node2D

@onready var player: CharacterBody2D = $"../player"

func _physics_process(_delta: float) -> void:
	if player.isMoving:
		$Illustration4.position.x = player.position.x + 506
		$Camera2D.position.x = player.position.x + 506
