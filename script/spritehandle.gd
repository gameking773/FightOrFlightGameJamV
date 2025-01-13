extends Node2D

@onready var player: CharacterBody2D = $".."
@onready var sprite: AnimatedSprite2D = $animatedSprite

func _process(_delta: float) -> void:
	$sword.visible = player.isUsingSword
	$gun.visible = not player.isUsingSword
	
	if not player.is_on_floor():
		sprite.animation = "jump"
	elif player.isAttacking:
		sprite.animation = "attack"
	elif player.isMoving:
		sprite.animation = "walk"
	else:
		sprite.animation = "idle"
