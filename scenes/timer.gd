extends Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func scream():
	$CanvasLayer/TextureRect.visible = true
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(1).timeout
	$CanvasLayer/TextureRect.visible = false

func _on_timeout() -> void:
	return
	#if randi_range(1,10) == 8:
		#scream()
