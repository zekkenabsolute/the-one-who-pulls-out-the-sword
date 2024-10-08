extends Area2D


var speed = 200  # Adjust the speed value

func _process(delta):
	var direction = (Vector2(0, 0) - $"../..".global_position).normalized()
	$"../..".global_position += direction * speed * delta

func _on_collision(body):
	if body.is_in_group("Player"):
		var node = body.get_node("%Node2D")
		node._on_hit()
	$"../..".queue_free()
