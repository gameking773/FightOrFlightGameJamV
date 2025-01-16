extends Node2D

@onready var player: CharacterBody2D = $"../player"
var rng = RandomNumberGenerator.new()
@export var parcelleCount:int = 0

func creerParcelle() -> void: # Note : Chaque parcelle est espacé de 570 sur l'axe x, x2 = 1140, l'axe y n'aura pas besoin d'être modifié
	var randomNum = rng.randi_range(0,10)
	var parcelleChoosen = "res://parcelle/sand_parcelle_template" + str(randomNum) + ".tscn"
	
	var parcelle = load(parcelleChoosen)
	var instance = parcelle.instantiate()
	parcelleCount += 1
	instance.position.x += 1140 * parcelleCount
	add_child(instance)
	await get_tree().create_timer(0.5).timeout
	creerParcelle()

func _ready() -> void:
	creerParcelle()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("reset-restart"):
		parcelleCount = 0
