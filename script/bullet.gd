extends Area2D

const speed = 100

func _process(_delta: float) -> void:
	position.x += speed

func _on_area_entered(area: Area2D) -> void:
	if area.name == "enemyhitbox_sword":
		queue_free()
