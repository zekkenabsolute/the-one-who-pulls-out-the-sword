extends Node2D

func _on_timer_timeout() -> void:
	var radius = 300
	var instance
	if (randf()>0.5):
		instance = preload("res://Scenes/arrow.tscn").instantiate()
	else: 
		instance = preload("res://Scenes/bullet.tscn").instantiate()
	var angle = randf() * TAU
	var x = cos(angle) * radius
	var y = sin(angle) * radius
	var ins_position = Vector2(x, y)
	instance.position = ins_position
	instance.rotation = angle
	add_child(instance)
	
