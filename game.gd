extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.healthy_tree_visible:
		$Tree/HealthyTree.show()
		$Tree/InfectedTree.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("intro_note"):
		$IntroNote.visible = !$IntroNote.visible

	
