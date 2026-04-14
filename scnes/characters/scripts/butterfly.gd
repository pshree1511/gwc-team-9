extends CharacterBody2D


func _process(delta: float) -> void:
	bounce()

func bounce():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "self.position", 0, 5)
	return tween.finished
