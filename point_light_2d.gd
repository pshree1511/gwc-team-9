extends PointLight2D

@onready var light = self
@export var unitTime = 0.2
@export var delay=3
@export var flashpattern = ".."
var solved=false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while !solved:
		await get_tree().create_timer(unitTime*delay).timeout
		await flashWord(flashpattern)
		await get_tree().create_timer(unitTime*5).timeout



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func lighton():
	light.visible=true
	
func lightoff():
	light.visible=false
	

func flashWord(pattern: String):
	for symbol in pattern:
		if symbol == ".":
			await dot()
		if symbol == '-':
			await dash()
		await get_tree().create_timer(unitTime*2).timeout
	
	




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
