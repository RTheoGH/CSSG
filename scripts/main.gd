extends Node

var running: bool
@onready var music = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	running = true
	$AudioStreamPlayer.play()
	new_game()
	$HUD/Lifebar.position = Vector2(50,50)
	get_node("job").connect("hit", Callable(self, "_on_hit"))
	get_node("HUD").get_node("Lifebar").connect("game_over", Callable(self, "_on_game_over"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var cam = get_node("Camera2D")
	var player_pos = get_node("chomeur").global_position
	var offset = Vector2.ZERO
	
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

func new_game():
	get_node("text").hide()
	get_node("Button").hide()
	get_node("chomeur").set_physics_process(true)
	get_node("chomeur").global_position = Vector2(0,0)
	get_node("job").set_physics_process(true)
	get_node("job").global_position = Vector2(150,100)
	running = true
	get_node("HUD").get_node("Lifebar").current_health = 5
	get_node("HUD").get_node("Lifebar").update_hearts()
	$AudioStreamPlayer.play()
	
func _on_hit():
	#get_node("text").show()
	#get_node("Button").show()
	#get_node("chomeur").set_physics_process(false)
	#get_node("job").set_physics_process(false)
	get_node("HUD").get_node("Lifebar").take_damage()
	
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
