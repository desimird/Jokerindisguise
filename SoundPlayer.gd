extends Node

const HURT = preload("res://Sounds/hurt.wav")
const HIT = preload("res://Sounds/Hit.wav")

onready var audio_players: = $AudioPlayers

func play_sound(sound):
	for audio_stream_player in audio_players.get_children():
		if not audio_stream_player.playing:
			audio_stream_player.stream = sound
			audio_stream_player.play()
			break
			
