extends Node2D

func _on_timer_timeout() -> void:
	var radius = 600
	var instance
	if (randf()>0.5):
		instance = preload("res://Scenes/Gameplay/arrow.tscn").instantiate()
	else: 
		instance = preload("res://Scenes/Gameplay/bullet.tscn").instantiate()
	var angle = randf() * TAU
	var x = cos(angle) * radius
	var y = sin(angle) * radius
	var ins_position = Vector2(x, y)
	instance.position = ins_position
	instance.rotation = angle
	add_child(instance)
	
