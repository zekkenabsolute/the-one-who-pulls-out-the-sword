extends Node

var dialogue_data = []

func _parse_csv_file(file_path: String):
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.READ)
		var content = file.get_as_text()
		file.close()
		var lines = content.split("\n")
		for line in lines:
			if line == "":
				continue
			var fields = line.split(",")
			dialogue_data.append(fields)
	else:
		push_error("My bro there is no file in the parser. check the spelling")

func _csv_read(x:int):
	if dialogue_data.size() > x:
		return dialogue_data[x]
	else:
		push_error("the script already finished my bro wth")
		return PackedStringArray(["debug","Script ended but didnt call next scene"])

func _ready():
	_parse_csv_file("res://Story/test.txt")
