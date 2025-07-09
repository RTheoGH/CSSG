extends Control

@export var full_heart = preload("res://scenes/fh.tscn")
@export var half_heart = preload("res://scenes/hh.tscn")

@export var max_health: int = 6
var current_health: int = 5
var invincible = false
var invincible_time = 2.0
var invincible_timer = 0.0

signal game_over

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	update_hearts()

func update_hearts() -> void:
	for child in get_children():
		child.queue_free()
		
	var hearts_to_draw = current_health
	var i = 0
	
	while i < max_health:
		var heart_instance
		if hearts_to_draw >= 2:
			heart_instance = full_heart.instantiate()
			heart_instance.play("default")
			hearts_to_draw -= 2
		elif hearts_to_draw == 1:
			heart_instance = half_heart.instantiate()
			hearts_to_draw -= 1
		else:
			break
			
		heart_instance.position = Vector2(50 * i,0)
		heart_instance.scale = Vector2(5,5)
		add_child(heart_instance)
		i += 1
		
func take_damage() -> void:
	if invincible:
		return
	
	current_health -= 1
	update_hearts()
	
	if current_health == 0:
		emit_signal("game_over")
	
	invincible = true
	invincible_timer = invincible_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if invincible:
		invincible_timer -= delta
		
		if invincible_timer <= 0:
			invincible = false
