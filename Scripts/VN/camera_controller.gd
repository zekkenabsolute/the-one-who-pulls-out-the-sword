extends Node2D  # O Sprite, dependiendo de tu nodo

# La fracción de la distancia que queremos que se mueva el nodo hacia el mouse
const MOVE_FRACTION := 0.01  # 40 px cuando el mouse esté a 400 px
var target_position
var parallax_bg
var parallax_char
var movement_speed = 3
var has_target = false
var parallax_mid
func _ready() -> void:
	parallax_bg= %ParallaxBg.get_meta("Parallax")
	parallax_char= %ParallaxChar.get_meta("Parallax")
	parallax_mid= %ParallaxMid.get_meta("Parallax")

func _process(delta) -> void:
	if has_target:
		var direction_to_target = (target_position - position).normalized()
		var distance_to_target = position.distance_to(target_position)
		var final_movement =direction_to_target * distance_to_target * movement_speed *delta
		position += final_movement
		_parallax_handler(final_movement)
		if position == target_position:
			has_target =false
			target_position =$"../ParallaxChar/CharacterBase".body

func _set_target_position(new_position:Vector2):
	target_position = new_position
	has_target = true
	

func _parallax_handler(movement:Vector2):
	%ParallaxBg.position += movement * parallax_bg
	%ParallaxChar.position += movement * parallax_char
	%ParallaxMid.position += movement * parallax_mid
