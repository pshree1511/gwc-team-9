extends Control

@onready var Line =%LineEdit2
var password
var key = "ignis"
var solved = Globals.solved

signal text_edited(solved)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(change)


func change():
		if Line.visible:
			Line.hide()
		else:
			Line.show()
		


func _on_line_edit_2_text_submitted(new_text: String) -> void:
	password = new_text
	print(password)
	if(password==key):
		solved = true
		print(solved)
		Line.clear()
		change()
		%Button.hide()
		$PuzzleButton.show() #show back to home button
		Globals.puzzle_button_visible = true #show start for puzzle game
	else:
		Line.clear()
	emit_signal("text_edited", solved)
