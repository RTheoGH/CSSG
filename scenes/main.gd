extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_game():
	get_node("text").hide()
	get_node("Button").hide()
	$chomeur.start(Vector2(0,0))
	$job.start(Vector2(150,100))

func _on_button_pressed() -> void:
	new_game()
