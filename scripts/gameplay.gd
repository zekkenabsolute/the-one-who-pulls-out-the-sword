extends Node2D

var hit_count = 0
func _ready() -> void:
	%SwordRB.contact_monitor =true
	%SwordRB.max_contacts_reported =20

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
	else:
		%Sword.hide()
		%Shield.show()

func _on_hit() -> void:
	hit_count +=1
	print("times hit: ",hit_count)

func _on_collision_sword(body):
	print ("Pleaseeeee")
	if body.has_method("_on_collision_destroy"): 
		body._on_collision_destroy()  
		print("Collision Sword")
	else:
		push_error("Collided body doesn't have the function 'some_function'")
func _on_collision_shield(body):
	if body.has_method("_on_collision_destroy"): 
		body._on_collision_destroy()  
	else:
		push_error("Collided body doesn't have the function 'some_function'")
func _on_collision_player(body):
	_on_hit()
