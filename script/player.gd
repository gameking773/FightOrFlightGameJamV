extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $character/animatedSprite

@export var isMoving = false

const SPEED = 300.0
const JUMP_VELOCITY = -450.0
const max_walkspeed = 1.25
var walkspeed = 0

# If False, using a gun
var isUsingSword = true

func gameover() -> void:
	isMoving = false
	walkspeed = 0
	$gameover.visible = true

func gamestart() -> void:
	$gameover.visible = false
	velocity = Vector2(0,0)
	position = Vector2(0,64)
	walkspeed = max_walkspeed
	isMoving = true
	await get_tree().create_timer(1).timeout

func _physics_process(delta: float) -> void:
	if isMoving:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
		# Handle walking.
		if walkspeed != 0:
			velocity.x = walkspeed * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug_leave"): # touche X
		get_tree().quit()
	
	if Input.is_action_just_pressed("reset-restart"):
		gamestart()
	
	if isMoving:
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		if Input.is_action_just_pressed("switch_weapon"):
			pass
		if Input.is_action_just_pressed("attack"):
			pass
		if Input.is_action_just_pressed("pause"):
			isMoving = false


func _on_main_menu_playispressed() -> void:
	gamestart()

func _on_hurtbox_trigger(objectHit: Area2D) -> void:
	var objectNature = objectHit.name
	
	if objectNature == "hitbox":
		gameover()
