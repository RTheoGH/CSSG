extends CharacterBody2D

@export var speed = 300
@export var job: Node2D

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	#var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta


#func _on_body_entered(body: Node2D) -> void:
	#get_parent().get_node("text").show()
	#get_parent().get_node("Button").show()
	#hide()
	#job.hide()
	#hit.emit()
	#$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	#$CollisionShape2D.disabled = false

#func _on_job_body_entered(body: Node) -> void:
	#get_parent().get_node("text").show()
	#get_parent().get_node("Button").show()
	#hide()
	#job.hide()
	#$CollisionShape2D.set_deferred("disabled", true)

func _on_body_entered(body: Node) -> void:
	print("allo salem ?")
	if(body.is_in_group("jobs")):
		get_parent().get_node("text").show()
		get_parent().get_node("Button").show()
		hide()
		job.hide()
		$CollisionShape2D.set_deferred("disabled", true)
	elif(body.is_in_group("walls")):
		print("allo ????")
