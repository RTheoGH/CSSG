extends Node

# Musics
@onready var music_overworld = $Music/Overworld
@onready var music_catch_the_butterfly = $Music/CatchTheButterfly
enum Music {
	OVERWORLD,
	CATCH_THE_BUTTERFLY
}

# Effects
@onready var effect_hit = $Effect/Hit
@onready var effect_save = $Effect/Save
@onready var effect_intro_catch_the_butterfly = $Effect/IntroCatchTheButterfly
enum Effect {
	HIT,
	SAVE,
	INTRO_CATCH_THE_BUTTERFLY
}


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func play_music(music: Music) -> AudioStreamPlayer:
	var music_player: AudioStreamPlayer
	match music:
		Music.OVERWORLD:
			music_overworld.play()
			music_player = music_overworld
		Music.CATCH_THE_BUTTERFLY:
			music_catch_the_butterfly.play()
			music_player = music_catch_the_butterfly
		_:
			print("Music not implemented")
	return music_player


func stop_music(music: Music):
	match music:
		Music.OVERWORLD:
			music_overworld.stop()
		Music.CATCH_THE_BUTTERFLY:
			music_catch_the_butterfly.stop()
		_:
			print("Music not implemented")


func play_effect(effect: Effect) -> AudioStreamPlayer:
	var effect_player: AudioStreamPlayer
	match effect:
		Effect.HIT:
			effect_player = effect_hit
		Effect.SAVE:
			effect_player = effect_save
		Effect.INTRO_CATCH_THE_BUTTERFLY:
			effect_player = effect_intro_catch_the_butterfly
		_:
			print("Effect not implemented")
			return
	effect_player.play()
	return effect_player
