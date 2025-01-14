extends CharacterBody2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()


func _on_hurtbox_trigger(objectHit: Area2D) -> void:
	var objectNature = objectHit.name
	
	if objectNature == "plrhitbox_sword":
		$Kill.play()
		queue_free()
		
	
