extends Node2D
var head 
var breast
var body
var crotch
func _ready() -> void:

	head = $Head.global_position
	breast = $Breast.global_position
	body = $Body.global_position
	crotch = $Crotch.global_position
