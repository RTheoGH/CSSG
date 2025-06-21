extends RigidBody2D

@export var speed = 200
@export var chomeur: Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if chomeur == null:
		return
		
	var target_pos = chomeur.global_position
	var direction = (target_pos - global_position).normalized()
	var distance = global_position.distance_to(target_pos)
	
	if distance > 1:
		global_position += direction * speed * delta

func start(pos):
	linear_velocity = Vector2.ZERO
	sleeping = true
	set_deferred("global_position", pos)
	sleeping = false
	show()
	$CollisionShape2D2.disabled = false
