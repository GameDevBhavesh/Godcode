extends TabContainer

export var folderFiles: NodePath
onready var folder_files = get_node(folderFiles)

var tabComponent = preload("res://components/EditTab.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	folder_files.connect("file_opened",self,"_assign_tab")
	pass
	
func _assign_tab(data):
	var newTab= tabComponent.instance()
	
	pass
	

