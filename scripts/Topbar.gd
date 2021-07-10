extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_MenuButton2_button_down():
	
	
	pass # Replace with function body.


func _on_FileDialog_dir_selected(dir):
	print(dir)
	var folder = Directory.new()
	if folder.open(dir) == OK:
		folder.list_dir_begin()
		var file_name = folder.get_next()
		while file_name != "":
			if folder.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
			file_name = folder.get_next()
	else:
		print("An error occurred when trying to access the path.")
pass



func _on_FileDialog_file_selected(path):
	print(path)
	pass # Replace with function body.


func _on_Topbar_ready():
	print("started")
	pass # Replace with function body.
