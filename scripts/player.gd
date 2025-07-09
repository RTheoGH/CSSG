extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var prev_position = Vector2()

func get_input():
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func _physics_process(delta: float) -> void:
	#_animated_sprite.play("default")q
	if(prev_position.x>position.x):
		_animated_sprite.scale.x = 1
	if(prev_position.x<position.x):
		_animated_sprite.scale.x = -1
	prev_position = position
	
	if is_on_floor():
		velocity.y = 0
	else:
		if Input.is_action_pressed("down"):
			velocity += get_gravity() * delta * 2
		else:
			velocity += get_gravity() * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	get_input()
	move_and_slide()

	if not is_on_floor():
		if velocity.y < 0:
			_animated_sprite.play("jump")
		else:
			_animated_sprite.play("fall")
	elif abs(velocity.x) > 10:
		_animated_sprite.play("walk")
	else:
		_animated_sprite.play("default")
