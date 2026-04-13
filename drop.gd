extends Area2D	

var total_pieces = 9
var placed_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.DARK_CYAN, 0.7)
	GameManager.piece_placed.connect(_on_piece_placed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.is_dragging:
		visible = true
	else:
		visible = false
	
func _on_piece_placed():
	placed_count += 1
	if placed_count >= total_pieces:
		$CompleteButton.visible = true
		
