extends Tree


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tree_ready():
	create_item().set_text(0,"test 1")
	create_item().set_text(0,"test 2")
	create_item().set_text(0,"test 3")
	create_item().set_text(1,"test 4")


func _on_Tree_mouse_entered():

 create_item().set_text(1,"test 4")
	
	

	
