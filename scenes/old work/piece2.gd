extends Node2D

var draggable = false
var is_inside_droppable = false
var body_ref
var initialPos: Vector2
var offset: Vector2
var correct_position = Vector2(400, 225)  # unique per piece
var snap_threshold = 50
var already_placed = false

signal placed_correctly

func _ready():
	initialPos = global_position
	offset = Vector2.ZERO
	print("Starting position: ", global_position)
	$Area2d.area_entered.connect(_on_area_2d_area_entered)
	$Area2d.area_exited.connect(_on_area_2d_area_exited)
	$Area2d.mouse_entered.connect(_on_area_2d_mouse_entered)
	$Area2d.mouse_exited.connect(_on_area_2d_mouse_exited)

func _process(_delta): 
	if draggable:
		if Input.is_action_just_pressed("click"):
			print("clicked!")
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true;
		
		if Input.is_action_pressed("click"):
			Global.drag_position = get_global_mouse_position()
			global_position = Global.drag_position - offset
			print("Position: ", global_position)
		elif Input.is_action_just_released("click"):
			
			var tween = get_tree().create_tween()
			
			_on_drop()
			if is_inside_droppable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "global_position",initialPos, 0.2).set_ease(Tween.EASE_OUT)			
			await tween.finished		
			Global.is_dragging = false
func _on_area_2d_mouse_entered():
	print("mouse entered!")
	if not Global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)
		
func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1,1)
		
func _on_area_2d_area_entered(area: Area2D):
	print("ANY area entered: ", area.name)
	if area.is_in_group('droppable'):
		is_inside_droppable = true
		area.modulate = Color(Color.MEDIUM_PURPLE, 1)
		body_ref = area 
		
func _on_area_2d_area_exited(area: Area2D):
	if area.is_in_group('droppable'):
		is_inside_droppable = false
		area.modulate = Color(Color.DARK_CYAN, 0.7)
		
		
func _on_drop():
	if already_placed:
		return
	print("body_ref: ", body_ref)
	print("body_ref position: ", body_ref.global_position if body_ref else "NULL")
	print("correct_position: ", correct_position)
	if is_inside_droppable and body_ref.global_position.distance_to(correct_position) < snap_threshold:
		already_placed = true
		GameManager.placed_count += 1
		GameManager.emit_signal("piece_placed")
