extends Node

var finalText =""
var currentText = ""
var current_line = 1
var is_talking
var is_in_cooldown = false

func _on_cooldown_bang():
	is_in_cooldown = false

func _on_timer_bang():
	$MainText/CharTime.wait_time = $HSlider.value

	if len(finalText) >0:
		currentText += finalText[0]
		finalText = finalText.substr(1,-1)
		$MainText.bbcode_text = currentText
	elif len(finalText)==0:
			$MainText/CharTime.stop()
			is_talking = false

func _process(_delta):
	if (Input.is_action_just_pressed("forward")&&!is_talking&&!is_in_cooldown):
		_next_text()
	elif (Input.is_action_just_pressed("forward")&&is_talking&&!is_in_cooldown):
		_skip_text()

func _skip_text():
	is_in_cooldown =true
	%Cooldown.start()
	is_talking =false
	currentText +=finalText
	$MainText.bbcode_text = currentText
	$MainText/CharTime.stop()

func _next_text():
	currentText =""
	is_in_cooldown =true
	%Cooldown.start()
	var csv = %TheParser._csv_read(current_line)
	%CharaName.bbcode_text = csv[0]
	finalText=csv[1]
	is_talking = true
	$MainText/CharTime.start()
	current_line +=1
