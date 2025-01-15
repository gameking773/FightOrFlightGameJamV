extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $animatedSprite

var isDead = false
var didSlash = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and not isDead:
		velocity += get_gravity() * delta

	move_and_slide()


func _on_hurtbox_trigger(objectHit: Area2D) -> void:
	var objectNature = objectHit.name
	
	if objectNature == "bullet" and not didSlash:
		didSlash = true
		$AnimationPlayer.play("sword_slash")
	elif objectNature == "bullet" and didSlash:
		$death.play()
		isDead = true
		sprite.pause()
		sprite.material.set_shader_parameter("isdead", true)
		await get_tree().create_timer(0.36).timeout
		queue_free()


func _on_detect_player_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "player" and not didSlash:
		$AnimationPlayer.play("sword_slash")
