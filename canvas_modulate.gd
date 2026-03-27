extends CanvasModulate

var unitTime=0.2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(unitTime*5).timeout
	await on()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self_modulate.color:a", 0, 5)
	return tween.finished
