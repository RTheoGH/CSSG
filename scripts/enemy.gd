class_name Enemy
extends Character

const SPEED = 150.0
const JUMP_VELOCITY = -400.0
@export var chomeur: Node2D

signal hit

func follow_chomeur(chomeur: Node2D):
	if chomeur == null:
		return
		
	var target_pos = chomeur.global_position
	var direction = (target_pos - global_position).normalized()
	velocity = direction * SPEED

func _physics_process(delta: float) -> void:
	
	if Global.fight_mode:
		return
		
	follow_chomeur(chomeur)
	
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "chomeur":
			print(Global.fight_mode)
			emit_signal("hit", self)
	
	#var collision = move_and_collide(velocity * delta)
	#if collision:
		#print("collision")
		#var collider = collision.get_collider()
		#if collider.name == "chomeur":
			#print("true")
			#emit_signal("game_over")
			
func get_class_name() -> String:
	return "Enemy"
