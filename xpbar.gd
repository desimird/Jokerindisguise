extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var xp_max = 5.0
var bar_length = 360
onready var color_rect_2 = $MarginContainer/ColorRect2
onready var timer = $Timer
onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("RESET")


func fill():
	var xp = Global.player_xp - (Global.player_level * 5)
	if xp == 0:
		if Global.should_play:
			animation_player.play("bar5")
			yield(animation_player, "animation_finished")
			animation_player.play("RESET")
			Global.should_play = false
		
	else:
	#print(color_rect_2.margin_bottom)
		if Global.should_play:
			animation_player.play("bar%d" % xp)
			Global.should_play = false
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



	
