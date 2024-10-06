extends Area2D


var speed = 100  # Adjust the speed value

func _process(delta):
	var direction = (Vector2(0, 0) - $"../..".global_position).normalized()
	$"../..".global_position += direction * speed * delta

func _on_collision(body):
	print("omg send help")
	$"../..".queue_free()
