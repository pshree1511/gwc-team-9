extends Node2D

@onready var win_ui = $YouWin
@onready var game_over_ui = $GameOver
@onready var monster = $Monster


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_ui.hide()
	game_over_ui.hide()
	monster.finished_shooting.connect(_on_monster_finished_shooting)
	Globals.game_over.connect(_on_game_over)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_monster_finished_shooting():
	get_tree().paused = true
	win_ui.show()
	

func _on_game_over():
	game_over_ui.show()
	get_tree().paused = true

func _on_texture_button_pressed() -> void:
	pass # Replace with function body.

func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_backhome_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://game.tscn")


func _on_home_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://game.tscn")
	Globals.infected_tree_visible = false
	Globals.healthy_tree_visible = true
