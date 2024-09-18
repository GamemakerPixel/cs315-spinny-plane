extends CanvasLayer

const GAME_OVER_ANIMATION = "slide_in"


func display_game_over():
	$Animation.play(GAME_OVER_ANIMATION)


func _on_play_again_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()
