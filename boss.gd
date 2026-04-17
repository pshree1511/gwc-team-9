extends Sprite2D

func _ready():
	if Globals.boss_button_visible:
		$TextureButton2.show()

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")
