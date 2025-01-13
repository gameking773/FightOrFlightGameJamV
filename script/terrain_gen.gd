extends Node2D

@onready var player: CharacterBody2D = $"../player"

# Note : Chaque parcelle est espacé de 570 sur l'axe x, l'axe y n'aura pas besoin d'être modifié
func _physics_process(_delta: float) -> void:
	if player.isMoving:
		pass
