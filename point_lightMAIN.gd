extends PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	off()
	fade()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fade():
	await get_tree().create_timer(2).timeout
	var tween= get_tree().create_tween()
	tween.tween_property(self, "energy", 1.3, 3)

func off():
	self.energy=0.1
