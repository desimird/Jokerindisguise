extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#signal enemy_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hitbox_body_entered(body):
	if not body is Player: return
	Global.camera.shake(100, 0.1, 100)
	Stats.health -= 1
	SoundPlayer.play_sound(SoundPlayer.HURT)
	#body.player_died()
	#print(Global.player_xp)
	
