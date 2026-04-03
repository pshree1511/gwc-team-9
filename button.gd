extends Control

@onready var Line =%LineEdit2
var password

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Line.text_submitted.connect(submitted)
	$Button.pressed.connect(change)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func submitted(text: String):
	password = text
	print(password)

func change():
		if Line.visible:
			Line.hide()
		
		else:
			Line.show()
		
