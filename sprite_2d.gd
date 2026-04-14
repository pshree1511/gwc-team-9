
#extends CharacterBody2D
#
#
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()

#extends CharacterBody2D
#
#@export var speed: float = 200.0
#@export var jump_force: float = -400.0
#@export var gravity: float = 900.0
#@export var dodge_speed: float = 400.0
#
#var is_dodging := false
#
#func _physics_process(delta):
	## Gravity
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Left/right movement
	#var direction = Input.get_axis("ui_left", "ui_right")
#
	#if is_dodging:
		#velocity.x = direction * dodge_speed
	#else:
		#velocity.x = direction * speed
#
	## Jump
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = jump_force
#
	## Dodge (Shift)
	#if Input.is_action_just_pressed("ui_select"):
		#is_dodging = true
		#await get_tree().create_timer(0.3).timeout
		#is_dodging = false
#
	#move_and_slide()
#
#func take_damage():
	#print("Player hit!")
	#queue_free()
	
#extends CharacterBody2D
#const GRAVITY : int = 4200
#const JUMP_SPEED : int = -1800
#
#func _physics_process(delta):
	#velocity.y += GRAVITY * delta
	#if is_on_floor():
		#if Input.is_action_pressed("ui_accept"):
			#velocity.y = JUMP_SPEED
	#move_and_slide()
	
extends CharacterBody2D

const GRAVITY: float = 4200.0
const JUMP_SPEED: float = -1800.0

func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0

	# Jump
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_SPEED

	move_and_slide()
