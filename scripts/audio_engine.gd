extends Node

# Musics
@onready var music_overworld = $Music/Overworld
enum Music {
	OVERWORLD
}

# Effects
@onready var effect_hit = $Effect/Hit
enum Effect {
	HIT
}


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func play_music(music: Music):
	match music:
		Music.OVERWORLD:
			music_overworld.play()
		_:
			print("Music not implemented")


func stop_music(music: Music):
	match music:
		Music.OVERWORLD:
			music_overworld.stop()
		_:
			print("Music not implemented")


func play_effect(effect: Effect, blocking: bool = false):
	var effect_player: AudioStreamPlayer
	match effect:
		Effect.HIT:
			effect_player = effect_hit
		_:
			print("Effect not implemented")
			return
	effect_player.play()
	if blocking:
		while effect_player.playing:
			pass
