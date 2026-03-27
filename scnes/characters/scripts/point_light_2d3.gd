extends PointLight2D

@onready var light = self
@export var unitTime = 0.2
@export var delay = 1
@export var pattern ="-."
var solved=false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(unitTime*delay).timeout
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
	for symbol in pattern:
		if symbol =='.':
			await dot()
		if symbol == '-':
			await dash()
		await get_tree().create_timer(unitTime).timeout
	




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
