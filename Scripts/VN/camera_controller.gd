extends Node2D  # O Sprite, dependiendo de tu nodo

# La fracción de la distancia que queremos que se mueva el nodo hacia el mouse
const MOVE_FRACTION := 0.01  # 40 px cuando el mouse esté a 400 px
var parallax_bg
var parallax_char
func _ready() -> void:
	parallax_bg= %ParallaxBg.get_meta("Parallax")
	parallax_char= %ParallaxChar.get_meta("Parallax")

func _process(_delta):
	# Posición del mouse en coordenadas globales
	var mouse_position = $".".get_local_mouse_position()
	
	# Dirección desde el nodo hacia el mouse
	var direction_to_mouse = (mouse_position - position).normalized()

	# Distancia al mouse
	var distance_to_mouse = position.distance_to(mouse_position)
	
	var final_movement =direction_to_mouse * distance_to_mouse * MOVE_FRACTION

	# Mueve el nodo una fracción de la distancia hacia el mouse
	position += final_movement
	_parallax_handler(final_movement)

func _parallax_handler(movement:Vector2):
	%ParallaxBg.position += movement * parallax_bg
	%ParallaxChar.position += movement * parallax_char
