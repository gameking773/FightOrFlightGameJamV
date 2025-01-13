extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $character/animatedSprite

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const max_walkspeed = 1.25
var walkspeed = 0

# If False, using a gun
var isUsingSword = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle walking.
	if walkspeed != 0:
		velocity.x = walkspeed * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug_start"):
		walkspeed = max_walkspeed
	if Input.is_action_just_pressed("debug_leave"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("switch_weapon"):
		pass
	if Input.is_action_just_pressed("attack"):
		pass
	if Input.is_action_just_pressed("pause"):
		pass
