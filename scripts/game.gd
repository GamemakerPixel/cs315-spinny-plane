extends Node2D


func _on_player_crashed():
	get_tree().paused = true
	$UI.display_game_over()
