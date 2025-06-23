extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
	get_node("job").connect("game_over", Callable(self, "_on_game_over"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_game():
	get_node("text").hide()
	get_node("Button").hide()
	get_node("chomeur").set_physics_process(true)
	get_node("chomeur").global_position = Vector2(0,0)
	get_node("job").set_physics_process(true)
	get_node("job").global_position = Vector2(150,100)
	
func _on_game_over():
	get_node("text").show()
	get_node("Button").show()
	get_node("chomeur").set_physics_process(false)
	get_node("job").set_physics_process(false)

func _on_button_pressed() -> void:
	new_game()
