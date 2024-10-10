extends Node

var can_action = true
var current_line = 1
var csv =PackedStringArray(["lol"])

func _process(_delta):
	if (Input.is_action_just_pressed("forward")&&can_action):
		_next_action()

func  _next_action():
	csv = %TheParser._csv_read(current_line)
	if (csv.size()==2):
		if (%TextBox.is_talking&&!%TextBox.is_in_cooldown):
			%TextBox._skip_text()
			$"../Bullet".animate_movement()
			$"../Bullet". tween.play()
		elif (!%TextBox.is_talking&&!%TextBox.is_in_cooldown):
			%TextBox._next_text(csv)
			current_line +=1
