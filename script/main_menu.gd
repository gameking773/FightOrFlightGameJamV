extends Control

signal playispressed

const menuTimeTillPlay = 1.0

func main_menu_despawn() -> void:
	while modulate.a > 0:
		await get_tree().create_timer(0.001).timeout
		modulate.a -= 0.01

func _on_jouer_pressed() -> void:
	main_menu_despawn()
	await get_tree().create_timer(menuTimeTillPlay).timeout
	playispressed.emit()

func _on_quitter_pressed() -> void:
	get_tree().quit()
