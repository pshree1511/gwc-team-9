extends PointLight2D

var solved = false
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	off()
	await fade()
	await get_tree().create_timer(2).timeout
	await blink()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fade():
	await get_tree().create_timer(2).timeout
	var tween= get_tree().create_tween()
	tween.tween_property(self, "energy", 3, 3)

func off():
	self.energy=0.1

func kindaoff(random):
	var tween= get_tree().create_tween()
	tween.tween_property(self, "energy", 2.5, random)
	
func blink():
	rng.randomize()
	self.energy=3
	while !solved:
		var random = rng.randf_range(0.5,1.0)
		await get_tree().create_timer(1).timeout
		var tween= get_tree().create_tween()
		tween.tween_property(self, "energy", 3, random)
		await get_tree().create_timer(1).timeout
		kindaoff(random)
