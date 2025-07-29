extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
var SPEED = 200.0
const JUMP_VELOCITY = -400.0
var prev_position = Vector2()

var is_invincible = false

func get_input():
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
func set_invincible(state: bool) -> void:
	if state:
		# passe à travers le mob pour éviter d'être stuck
		is_invincible = true
		set_collision_layer_value(4, false)
		set_collision_mask_value(4, false)
		#collision_layer &= ~4
		#collision_mask &= ~4
		#$CollisionShape2D.disabled = true
		modulate.a = 0.5
	else:
		is_invincible = false
		set_collision_layer_value(4, true)
		set_collision_mask_value(4, true)
		#collision_layer |= 4
		#collision_mask |= 4
		#$CollisionShape2D.disabled = false
		modulate.a = 1.0

func _physics_process(delta: float) -> void:
	#_animated_sprite.play("default")q
	if(prev_position.x>position.x):
		_animated_sprite.scale.x = 1
	if(prev_position.x<position.x):
		_animated_sprite.scale.x = -1
	prev_position = position
	
	var anim_lock = false
	
	if is_on_floor():
		velocity.y = 0
		if Input.is_action_pressed("down"):
			anim_lock = true
			_animated_sprite.play("sneak")
			
			SPEED = 50
		elif Input.is_action_pressed("up"):
			anim_lock = true
			_animated_sprite.play("view_top")
		else:
			SPEED = 200
			_animated_sprite.play("default")
	else:
		if Input.is_action_pressed("down"):
			velocity += get_gravity() * delta * 2
		else:
			velocity += get_gravity() * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if is_invincible:
		var time := Time.get_ticks_msec() / 100.0
		var alpha := 0.4 + 0.4 * sin(time)
		modulate = Color(modulate.r, modulate.g, modulate.b, alpha)
	else:
		modulate.a = 1.0
	
	get_input()
	move_and_slide()
	
	if not anim_lock:
		if not is_on_floor():
			if velocity.y < 0:
				_animated_sprite.play("jump")
			else:
				_animated_sprite.play("fall")
		elif abs(velocity.x) > 10:
			_animated_sprite.play("walk")
		else:
			_animated_sprite.play("default")
