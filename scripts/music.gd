extends AudioStreamPlayer

const BUS = "Music"
const MUSIC_STREAM: AudioStream = preload("res://assets/music/Three Red Hearts - Penguin Town.ogg")


func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	stream = MUSIC_STREAM
	bus = BUS
	play()
