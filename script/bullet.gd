extends Area2D

const speed = 100

func _process(_delta: float) -> void:
	position.x += speed
