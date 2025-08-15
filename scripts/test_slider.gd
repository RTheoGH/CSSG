extends Node2D

@onready var mat: Material = $ColorRect.material
@onready var slider: HSlider = $HSlider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ColorRect.set_meta("progression", slider.value)
	$ColorRect2.material.set_shader_parameter("progression", slider.value)
	
