extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

@onready var light = $PointLight2D2
var unitTime = 0.2
var solved=false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while !solved:
		await flashWord()
		await get_tree().create_timer(unitTime*5).timeout



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func lighton():
	light.visible=true
	
func lightoff():
	light.visible=false
	

func flashWord():
	await dash()
	await get_tree().create_timer(unitTime).timeout
	await dash()
	await get_tree().create_timer(unitTime).timeout
	await dot()





func dot():
	lighton()
	await get_tree().create_timer(unitTime).timeout
	lightoff();
	await get_tree().create_timer(unitTime).timeout
	
func dash():
	lighton()
	await get_tree().create_timer(unitTime*4).timeout
	lightoff()
	await get_tree().create_timer(unitTime).timeout
