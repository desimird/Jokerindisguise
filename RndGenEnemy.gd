extends Position2D


export(PackedScene) var enemy

export(int) var grid_size = 72

export(int) var randzic = 20
export(int) var uslovcic = 10

signal instance_node(node, location)

func _ready():
	randomize()

func _process(delta):
	#print(Global.world)
	if Global.world != null:
		if !is_connected("instance_node", Global.world, "instance_node"):
			connect("instance_node", Global.world, "instance_node")
			



func _on_Timer_timeout():
	
	var action = round(rand_range(0, randzic))
	if action > 0 and action < uslovcic:
		global_position.x -= grid_size
	if action > uslovcic and action < 2*uslovcic:
		global_position.x += grid_size
	
	global_position.x = clamp(global_position.x, 35, 410)
	


	
	emit_signal("instance_node", enemy, global_position)

