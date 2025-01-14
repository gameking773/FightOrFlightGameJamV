extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $character/animatedSprite

@export var isMoving = false
@export var isAttacking = false

const SPEED = 300.0
const JUMP_VELOCITY = -450.0
const max_walkspeed = 1.25
var walkspeed = 0

# If False, using a gun
@export var isUsingSword = true

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
			isUsingSword = not isUsingSword
		if Input.is_action_just_pressed("attack"):
			if isUsingSword:
				$character/attackAnim.play("swordAtk")
			else:
				$character/attackAnim.play("gunAtk")
		if Input.is_action_just_pressed("pause"):
			isMoving = false


func _on_main_menu_playispressed() -> void:
	gamestart()

func _on_hurtbox_trigger(objectHit: Area2D) -> void:
	var objectNature = objectHit.name
	
	if objectNature == "hitbox":
		gameover()

func _on_animation_started(anim_name: StringName) -> void:
	if anim_name == "gunAtk":
		await get_tree().create_timer(0.4333).timeout
		var bullet = load("res://scene/bullet.tscn")
		var instance = bullet.instantiate()
		instance.position.x += 120
		add_child(instance)
