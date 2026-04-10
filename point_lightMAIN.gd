extends PointLight2D

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	off()
	await fade()
	await get_tree().create_timer(2).timeout
	await blink()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if InputEventMouseMotion && globals.solved==false:
		global_position = get_global_mouse_position()
	else:
		var tween= get_tree().create_tween()
		tween.tween_property(self, "global_position", Vector2(0,0), 2)

func fade():
	await get_tree().create_timer(2).timeout
	var tween= get_tree().create_tween()
	tween.tween_property(self, "energy", 3, 1.6)
	
func fade2():
	await get_tree().create_timer(2).timeout
	var tween= get_tree().create_tween()
	tween.tween_property(self, "texture_scale", 10, 4)
	tween.tween_property(self, "energy", 2, 3)
	
func off():
	self.energy=0.1

func kindaoff(random):
	var tween= get_tree().create_tween()
	tween.tween_property(self, "energy", 2.3, random)
	
func blink():
	rng.randomize()
	self.energy=3
	while !globals.solved:
		var random = rng.randf_range(0.5,1.0)
		await get_tree().create_timer(1).timeout
		var tween= get_tree().create_tween()
		tween.tween_property(self, "energy", 3, random)
		await get_tree().create_timer(1).timeout
		kindaoff(random)
	if(globals.solved):
		fade2()
