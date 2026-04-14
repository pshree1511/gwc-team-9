extends PointLight2D

@onready var light = self
@export var unitTime = 0.2
var rng = RandomNumberGenerator.new()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(5).timeout
	randomize()
	flash()



func lighton():
	light.visible=true
	
func lightoff():
	light.visible=false
	
func flash():
	rng.randomize()
	while not Globals.solved:
		var random = rng.randf_range(0.0,0.5)
		await get_tree().create_timer(random).timeout
		lighton()
		await get_tree().create_timer(random).timeout
		lightoff()
