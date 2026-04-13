extends Area2D


func _ready():
	modulate = Color(Color.DARK_CYAN, 0.7)


func _process(_delta):
	if Global.is_dragging:
		visible = true
	else:
		visible = false
