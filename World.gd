extends Node2D


func ready():
	print(self)
	Global.world = self
	
func _process(delta):
	Global.world = self
	#print(Global.player_xp - (Global.player_level * 5))
func _exit_tree():
	Global.world = null
	
func instance_node(node, location):
	
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = location 
