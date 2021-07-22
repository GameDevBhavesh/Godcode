extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FolderDialog_dir_selected(dir):
	var fileView = $Panel/ContentWindow/LeftBar/FilesView/VSplitContainer/FolderFiles
	fileView.clear()
	print(dir)
	var folder = Directory.new()
	if folder.open(dir) == OK:
		folder.list_dir_begin()
		fileView.create_item().set_text(0,folder.get_current_dir().get_file())
		
		var file_name = folder.get_next()
		var index=0;
	
		while file_name != "":
			if folder.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				var current_item_path = folder.get_current_dir()+"/"+file_name
				var item = $Panel/ContentWindow/LeftBar/FilesView/VSplitContainer/FolderFiles.create_item()
				item.set_text(0,file_name)
				item.set_selectable(0,true)
				item.set_metadata(0,current_item_path)
			
				index+=1
			file_name = folder.get_next()
			
	else:
		print("An error occurred when trying to access the path.")
pass


func _on_Control_ready():
	
	Engine.target_fps= 60
	$Panel/Topbar/HBoxContainer/File.get_popup().connect("id_pressed", self, "file_menu")
	
	pass # Replace with function body.

func file_menu( id ):
	match id:
		0:
			print("New")
		1:
			print("openFolder")
			$"Panel/Topbar/FolderDialog".popup()
		2:
			print("openFile")
			$"Panel/Topbar/FileDialog".popup()
		3:
			get_tree().quit()


func _on_FileDialog_file_selected(path):
		var file =  File.new()
		file.open(path,1)
		var item = $Panel/ContentWindow/LeftBar/FilesView/VSplitContainer/Outside.create_item()
		item.set_text(0,path)
		item.add_button(0,null)
		$Panel/ContentWindow/ActionPanel/VSplitContainer/TabContainer/EditArea.text =  file.get_as_text()
