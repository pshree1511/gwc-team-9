extends PointLight2D

@onready var light = self
@export var unitTime = 0.2
var solved=false
var rng = RandomNumberGenerator.new()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(5).timeout
	randomize()
	flash()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func lighton():
	light.visible=true
	
func lightoff():
	light.visible=false
	
func flash():
	rng.randomize()
	while !solved:
		var random = rng.randf_range(0.0,0.5)
		await get_tree().create_timer(random).timeout
		lighton()
		await get_tree().create_timer(random).timeout
		lightoff()
