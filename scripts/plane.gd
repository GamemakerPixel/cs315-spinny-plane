extends RigidBody2D

signal crashed

# Pixels per second
const SPEED = 256

# kg * px / s
const JUMP_MAGNITUDE = 512

# Animations
const FLAP_ANIMATION = "flap"
const GLIDE_ANIMATION = "glide"

# Inputs
const FLAP_INPUT = "flap"


func _ready() -> void:
	linear_velocity = SPEED * Vector2.RIGHT


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(FLAP_INPUT):
		_jump()


func _jump():
	# Remove the effect of gravity for consitant jump heights.
	linear_velocity.y = 0
	apply_impulse(JUMP_MAGNITUDE * Vector2.UP)
	$Sprite.play(FLAP_ANIMATION)
	$FlapSound.play()


func _on_sprite_animation_finished() -> void:
	if $Sprite.animation == FLAP_ANIMATION:
		$Sprite.play(GLIDE_ANIMATION)


func _on_body_entered(body: Node) -> void:
	$CrashSound.play()
	crashed.emit()
