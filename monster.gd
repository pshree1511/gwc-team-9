#extends Node2D
#
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
#extends Node2D
#
#@export var fireball_scene: PackedScene
#@export var shoot_delay := 2.0
#
#var player
#
#func _ready():
	#player = get_tree().get_first_node_in_group("player")
	#shoot_loop()
#
#func shoot_loop():
	#while true:
		#await get_tree().create_timer(shoot_delay).timeout
		#shoot_fireball()
#
#func shoot_fireball():
	#if player == null:
		#return
#
	#var fireball = fireball_scene.instantiate()
	#get_parent().add_child(fireball)
#
	#fireball.global_position = global_position
#
	#var direction = (player.global_position - global_position).normalized()
	#fireball.direction = direction

extends Node2D

@export var fireball_scene: PackedScene

func _ready():
	print("Monster ready")
	shoot_loop()

func shoot_loop():
	while true:
		await get_tree().create_timer(2.0).timeout
		if get_tree().paused:
			return
		shoot_fireball()

func shoot_fireball():
	print("Shooting")

	if fireball_scene == null:
		print("No fireball scene!")
		return

	var fireball = fireball_scene.instantiate()
	get_parent().add_child(fireball)

	fireball.global_position = global_position
	fireball.direction = Vector2.LEFT
