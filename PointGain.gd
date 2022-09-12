extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PointGain_body_entered(body):
	Global.should_play = true
	SoundPlayer.play_sound(SoundPlayer.HIT)
	Global.player_xp += 1
	var id = get_instance_id()
	instance_from_id(id).get_parent().queue_free()
	#print(Global.player_xp)
	Event.emit_signal("point_hited")
	

