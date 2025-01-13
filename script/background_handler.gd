extends Node2D

@onready var player: CharacterBody2D = $"../player"

func _physics_process(delta: float) -> void:
	if player.isMoving:
		$background.position.x = player.position.x + 506
