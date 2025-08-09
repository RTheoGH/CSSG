extends Node

var running: bool
@onready var music = $AudioStreamPlayer
@onready var fight_text = $FightHUD/ColorRect/dialogue
var current_enemy := ""
var one_time = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	running = true
	$AudioStreamPlayer.play()
	new_game()
	$WorldHUD/Lifebar.position = Vector2(50,50)
	$FightHUD.hide()
	get_node("job").connect("hit", Callable(self, "_on_hit"))
	get_node("WorldHUD").get_node("Lifebar").connect("game_over", Callable(self, "_on_game_over"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Global.fight_mode:
		process_world(delta)
	else:
		process_fight(delta)
		

func process_world(delta: float):
	var cam = get_node("Camera2D")
	var player_pos = get_node("chomeur").global_position
	var offset = Vector2.ZERO
	
	if Input.is_action_pressed("fullscreen"):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	if Input.is_action_pressed("camera_right"):
		offset.x += 50
	if Input.is_action_pressed("camera_left"):
		offset.x -= 50
	if Input.is_action_pressed("camera_up"):
		offset.y -= 50
	if Input.is_action_pressed("camera_down"):
		offset.y += 50
		
	var zoom = cam.zoom
	if Input.is_action_just_released("camera_dezoom") and cam.zoom.x > 2.5 and cam.zoom.y > 2.5:
		cam.zoom.x -= 0.1
		cam.zoom.y -= 0.1
		print(cam.zoom.x,",",cam.zoom.y)
	if Input.is_action_just_released("camera_zoom") and cam.zoom.x < 3 and cam.zoom.y < 3:
		cam.zoom.x += 0.1
		cam.zoom.y += 0.1
		print(cam.zoom.x,",",cam.zoom.y)
	
	var target_pos = player_pos + offset
	var speed = get_node("chomeur").SPEED - 10
	if running:
		cam.global_position = cam.global_position.move_toward(target_pos,speed*delta)

func process_fight(delta: float):
	fight_text.visible_ratio += 0.05
	if Input.is_action_just_pressed("ui_accept") and !one_time:
		$FightHUD/ColorRect/dialogue.hide()
		$FightHUD/ColorRect/main_select.show()
		one_time = true
		#var skills_hud := preload("res://scenes/skill_select.tscn")
		#var skills_hud := SkillSelect.($chomeur.skills)
		#skills_hud.name = "SkillSelect"
		#print(get_node("chomeur").skills)
		#var apagnan = skills_hud.instantiate()
		#$FightHUD.add_child(apagnan)
		#$FightHUD/SkillSelect.get_chomeur_skills(get_node("chomeur").skills)
		
func new_game():
	get_node("text").hide()
	get_node("Button").hide()
	get_node("chomeur").set_physics_process(true)
	get_node("chomeur").global_position = Vector2(0,0)
	get_node("job").set_physics_process(true)
	get_node("job").global_position = Vector2(150,100)
	running = true
	get_node("WorldHUD").get_node("Lifebar").current_health = 5
	get_node("WorldHUD").get_node("Lifebar").update_hearts()
	$AudioStreamPlayer.play()
	
#true = fight mode, false = world mode
func toggle_fight_mode(fight_mode: bool):
	print("switch de mode")
	Global.fight_mode = fight_mode
	
	if(fight_mode):
		$WorldHUD.hide()
		$FightHUD.show()
		set_background_opacity(0)
		var tween_background = $CanvasLayer/Fight_Background.create_tween()
		tween_background.set_ease(Tween.EASE_IN)
		tween_background.tween_property($CanvasLayer/Fight_Background, "color:a", 0.5, 0.2)
		fight_text.visible_ratio = 0
		$FightHUD/Enemy_fight_sprite.play("default")
		$FightHUD/Player_fight_sprite.play("default")
		
	else:
		$WorldHUD.show()
		$FightHUD.hide()
		
func set_background_opacity(alpha: float):
	$CanvasLayer/Fight_Background.color.a = alpha
	
func _on_hit(enemy: Enemy):
	#get_node("text").show()
	#get_node("Button").show()
	#get_node("chomeur").set_physics_process(false)
	#get_node("job").set_physics_process(false)
	if !Global.fight_mode:
		$FightHUD/Enemy_fight_sprite.sprite_frames = enemy.get_node("AnimatedSprite2D").sprite_frames
		current_enemy = enemy.get_class_name()
		fight_text.text = "Un " + current_enemy + " sauvage apparaît !"
		toggle_fight_mode(true)
		
			
	get_node("WorldHUD").get_node("Lifebar").take_damage()
	
func _on_game_over():
	get_node("text").show()
	get_node("Button").show()
	get_node("chomeur").set_physics_process(false)
	get_node("job").set_physics_process(false)
	get_node("Camera2D").global_position = Vector2(0,0)
	running = false
	$AudioStreamPlayer.stop()
	

func _on_button_pressed() -> void:
	new_game()
