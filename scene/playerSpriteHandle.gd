extends Node2D

@onready var player: CharacterBody2D = $".."
@onready var sprite: AnimatedSprite2D = $animatedSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not player.is_on_floor():
		sprite.animation = "jump"
	elif player.isAttacking:
		sprite.animation = "attack"
	elif player.isMoving:
		sprite.animation = "walk"
	else:
		sprite.animation = "idle"
