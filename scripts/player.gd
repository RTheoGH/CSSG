extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func get_input():
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
