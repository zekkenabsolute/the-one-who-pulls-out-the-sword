extends Node2D

var hit_count = 0

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var object_pos = global_position
	var direction = mouse_pos - object_pos
	
	var angle = direction.angle()
	
	var angle_in_degrees = rad_to_deg(angle)
	rotation_degrees = angle_in_degrees
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		%Shield.hide()
		%Sword.show()
		$Shield/CharacterBody2D/CollisionShape2D.disabled=true
		$Sword/CharacterBody2D/CollisionShape2D.disabled=false
	else:
		%Sword.hide()
		%Shield.show()
		$Shield/CharacterBody2D/CollisionShape2D.disabled=false
		$Sword/CharacterBody2D/CollisionShape2D.disabled=true
func _on_hit() -> void:
	hit_count +=1
	%"times hit".bbcode_text = "hit count: %d" % hit_count
