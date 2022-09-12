extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animated_sprite = $AnimatedSprite
#onready var label_2 = $Label2
onready var label_3 = $Label3
onready var label_4 = $Label4
onready var xpbar = $xpbar
onready var margin_container = $MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	margin_container.margin_right = 485 + Stats.health*20
	animated_sprite.frame = Global.player_level+1
	#label_2.text = "XP = %d " % Global.player_xp
	label_3.text = "HP "
	label_4.text = "HIGH SCORE = \n %d" % Global.high_score
	xpbar.fill()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
