extends Window

@onready var popup = self
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	popup.hide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("code_book"):
		popup.visible=!popup.visible

func _on_close_requested() -> void:
	popup.hide()
