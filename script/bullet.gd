extends Area2D

const speed = 100

func _process(delta: float) -> void:
	position.x += speed


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
