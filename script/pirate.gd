extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $animatedSprite

var isDead = false
var didFire = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and not isDead:
		velocity += get_gravity() * delta

	move_and_slide()


func _on_hurtbox_trigger(objectHit: Area2D) -> void:
	var objectNature = objectHit.name
	
	if objectNature == "plrhitbox_sword":
		$death.play()
		$collisionbox.queue_free()
		isDead = true
		sprite.pause()
		sprite.material.set_shader_parameter("isdead", true)
		await get_tree().create_timer(0.36).timeout
		queue_free()
	elif objectNature == "bullet":
		$fire.play("deflect")
		$ricochet.play()
		# se joue qu'une seule fois?


func _on_vision_entered(object: Area2D) -> void:
	var objectNature = object.name
	
	if objectNature == "playerArea" and not didFire:
		didFire = true
		$fire.current_animation = "flintlock_fire"
		await get_tree().create_timer(0.6333).timeout
		var bullet = load("res://scene/bullet_enemy.tscn")
		var instance = bullet.instantiate()
		instance.position.x -= 120
		add_child(instance)
