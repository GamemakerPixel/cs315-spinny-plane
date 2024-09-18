extends Node2D

const SPAWN_OFFSET = 0

@export var rock_scene: PackedScene
@export var player: Node2D


func _spawn_rock():
	var window_size = Vector2i(
		ProjectSettings.get_setting("display/window/size/viewport_width"),
		ProjectSettings.get_setting("display/window/size/viewport_height"),
	)
	
	var rock = rock_scene.instantiate()
	var inverted = randf() < 0.5
	
	rock.rotation = PI if inverted else 0.0
	rock.position.x = window_size.x + SPAWN_OFFSET + player.position.x
	rock.position.y = -window_size.y / 2.0 if inverted else window_size.y / 2.0 
	
	add_child(rock)
