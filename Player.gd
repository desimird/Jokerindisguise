extends KinematicBody2D
class_name Player

export(int) var MAX_SPEED = 200
export(int) var ACCELERATION = 900
export(int) var FRICTION = 600

onready var animated_sprite = $AnimatedSprite

var input = Vector2.ZERO
var velocity = Vector2.ZERO

func _ready():
#	Global.player_level = int(Global.player_xp/5)
#	animated_sprite.frame = Global.player_level
	Stats.connect("no_health",self, "queue_free")
	Stats.connect("no_health", self, "change_screen")
	pass
	
func _physics_process(delta):
	global_position.x = clamp(global_position.x, 35, 410)
	Global.player_level = int(Global.player_xp/5)
	animated_sprite.frame = Global.player_level
#	if Global.player_should_die:
#		player_died()
	input.x = Input.get_axis("ui_left", "ui_right")
	
	if not horizontal_move(input):
		apply_friction(delta)
	
	if horizontal_move(input):
		apply_acceleration(input.x, delta)
		
	velocity = move_and_slide(velocity, Vector2.UP)
	


func horizontal_move(input):
	return input.x != 0
	
func apply_acceleration(amount, delta):
	velocity.x = move_toward(velocity.x, MAX_SPEED * amount, ACCELERATION * delta)

func apply_friction(delta):
	velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

func player_died():
	get_tree().change_scene("res://GameOver.tscn")
	queue_free()
	
func change_screen():
	
		Stats.health = Stats.max_health
		get_tree().change_scene("res://GameOver.tscn")
