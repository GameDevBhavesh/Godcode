extends Tree

signal file_opened(data)

func _ready():
	connect("cell_selected",self,"_item_selected")
	connect("item_activated",self,"_dubble_click")
	
	print("ready folder Files")
	pass
	
func _item_selected():
	
	var item=  self.get_selected()
	var filePath= item.get_metadata(0)
	
	if filePath:
		print("selected "+filePath)
		var file =File.new()
		file.open(filePath,1)
		$"../../../../ActionPanel/VSplitContainer/TabContainer/EditArea".text=file.get_as_text()
	pass

func _dubble_click():
	
	var item=  self.get_selected()
	var filePath= item.get_metadata(0)
	emit_signal("file_opened",filePath)
	pass # Replace with function body.
