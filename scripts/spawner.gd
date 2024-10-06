extends Node2D

func _on_timer_timeout() -> void:
	var x = randf_range(-600,600)
	var y = randf_range(-600,600)
	var instance = preload("res://scenes/arrow.tscn").instantiate()
	instance.position = Vector2 (x,y)
	add_child(instance)
