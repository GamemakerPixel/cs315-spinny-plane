extends StaticBody2D


func _on_screen_exited() -> void:
	queue_free()
	print("exited")
