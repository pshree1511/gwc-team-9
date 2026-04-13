extends Area2D

var draggable = false
var is_inside_droppable = false
var body_ref
var initialPos: Vector2
var offset: Vector2

func _ready():
	initialPos = global_position
	offset = Vector2.ZERO
	print("Starting position: ", global_position)

func _process(_delta): 
	if draggable:
		if Input.is_action_just_pressed("click"):
			print("clicked!")
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true;
		
		if Input.is_action_pressed("click"):
			Global.drag_position = get_global_mouse_position()
			get_parent().global_position = Global.drag_position - offset
			print("Position: ", global_position)
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position",initialPos, 0.2).set_ease(Tween.EASE_OUT)
				

func _on_area_2d_mouse_entered():
	print("mouse entered!")
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)
		
func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1,1)
		
func _on_area_2d_body_entered(body: StaticBody2D):
	if body.is_in_group('droppable'):
		is_inside_droppable = true
		body.modulate = Color(Color.MEDIUM_PURPLE, 1)
		body_ref = body 
		
func _on_area_2d_body_exited(body):
	if body.is_in_group('droppable'):
		is_inside_droppable = false
		body.modulate = Color(Color.DARK_CYAN, 0.7)
		
