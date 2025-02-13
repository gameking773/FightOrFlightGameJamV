extends Area2D

var speed = 10
var deflectRatio = 0
var rng = RandomNumberGenerator.new()

func _process(_delta: float) -> void:
	position.x -= speed
	position.y += deflectRatio
	await get_tree().create_timer(3).timeout
	queue_free()

func deflect() -> void:
	speed = -speed
	deflectRatio = rng.randf_range(-20,-40)
	rotation = 130
	$deflect.play()
	await get_tree().create_timer(1).timeout
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.name == "plrhitbox_sword":
		deflect()
