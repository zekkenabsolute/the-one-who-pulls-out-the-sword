extends Node2D

@onready var tween: Tween = Tween.new()
var target_position: Vector2

func _ready():
	# Set the target position for the animation
	target_position = Vector2(400, 300)

	# Call the function to animate the movement

func animate_movement():
	# Start the tween
	var start_position = position  # Current position of the node
	var duration = 2.0  # Duration of the animation in seconds
	var trans_type = Tween.TRANS_SINE  # Type of easing (smooth transition)
	var ease_type = Tween.EASE_IN_OUT  # Easing direction (smooth start and end)
	var elapsedT = tween.get_total_elapsed_time()
	position = tween.interpolate_value(position, position - target_position, elapsedT, duration, trans_type, ease_type)
