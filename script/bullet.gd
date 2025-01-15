extends Area2D

const speed = 100

func _process(_delta: float) -> void:
	position.x += speed
	await get_tree().create_timer(0.5).timeout
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.name == "enemyhitbox_sword":
		queue_free()
