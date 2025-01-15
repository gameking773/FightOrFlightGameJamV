extends Node2D

@onready var player: CharacterBody2D = $"../player"
var rng = RandomNumberGenerator.new()
var parcelleCount = 0

func creerParcelle() -> void:
	var randomNum = rng.randi_range(0,9)
	var parcelleChoosen = "res://parcelle/sand_parcelle_template" + str(randomNum) + ".tscn"
	
	var parcelle = load(parcelleChoosen)
	var instance = parcelle.instantiate()
	parcelleCount += 1
	instance.position.x += 1140 * parcelleCount
	add_child(instance)

func _ready() -> void:
	creerParcelle()

# Note : Chaque parcelle est espacé de 570 sur l'axe x, x2 = 1140, l'axe y n'aura pas besoin d'être modifié
func _physics_process(_delta: float) -> void:
	
	if player.isMoving:
		await get_tree().create_timer(1).timeout
		
		creerParcelle()
