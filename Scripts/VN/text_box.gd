extends Node2D

var finalText ="donuts!"
var currentText = ""
var current_line = 1
var is_talking
var is_in_cooldown = false

func _on_cooldown_bang():
	is_in_cooldown = false

func _on_timer_bang():
	%CharTime.wait_time = 0.05

	if len(finalText) >0:
		currentText += finalText[0]
		finalText = finalText.substr(1,-1)
		%MainText.bbcode_text = currentText
	elif len(finalText)==0:
			%CharTime.stop()
			is_talking = false


func _skip_text():
	is_in_cooldown =true
	%Cooldown.start()
	is_talking =false
	currentText +=finalText
	%MainText.bbcode_text = currentText
	%CharTime.stop()

func _next_text(csv:PackedStringArray):
	if (csv[0]!="continue"):
		currentText =""
		%CharaName.bbcode_text = csv[0]
	is_in_cooldown =true
	%Cooldown.start()
	finalText=csv[1]
	is_talking = true
	%CharTime.start()
	
