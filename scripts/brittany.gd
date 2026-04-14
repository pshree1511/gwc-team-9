extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$Node2D.hide()
	var child = $Node
	child.connect("text_edited", Callable(self, "_on_child_text_edited"))

func _on_child_text_edited(solved2):
	if(solved2==true):
		Globals.solved=true
		print("WORKS")
		$Node2D.show()
		await get_tree().create_timer(3).timeout
		$characters/butterfly/AnimatedSprite2D2.show()
		await get_tree().create_timer(1).timeout
		$Node2D.hide()
