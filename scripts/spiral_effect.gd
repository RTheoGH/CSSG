extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var grad := load("res://ressources/images/gradient_spiral.tres")
	var c = get_meta("progression")
	grad.fill_to = Vector2(c, c)
	material.set_shader_parameter("gradient_spiral", grad)
	c = c * 2 - 0.999
	#print("c : ", c)
	grad.gradient.colors[1] = Color(1-c, 1-c, 1-c, 1)
	material.set_shader_parameter("attenuation_gradient", grad)
