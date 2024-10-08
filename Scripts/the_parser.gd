extends Node
var dialogue_data = []
func _parse_csv_file(file_path: String):
	print ("Is there any data?")
	if FileAccess.file_exists(file_path):
		print ("I think...")
		var file = FileAccess.open(file_path, FileAccess.READ)
		var content = file.get_as_text()
		file.close()
		var lines = content.split("\n")
		for line in lines:
			if line == "":
				continue
			var fields = line.split(",")
			print (str("line is = ",line, " fields is = ",fields))
			dialogue_data.append(fields)
	else:
		print ("no...")

func _csv_read(x:int):
	if dialogue_data.size() > x:
		return dialogue_data[x]
	else:
		push_error("the script already finished my bro wth") 

func _ready():
	print("oh hi!")
	_parse_csv_file("res://Story/test.txt")

	print (dialogue_data.size())
	
	#this is for debug purposes
	
	#for row in dialogue_data:
	#	print(row)
