extends Node2D

var boite_diag
var skills
var chomeur
var back

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_parent())
	boite_diag = get_parent().get_node("dialogue")
	skills = get_parent().get_node("SkillSelect")
	chomeur = get_parent().get_parent().get_parent().get_node("chomeur")
	back = get_parent().get_node("back")
	self.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_attack_pressed() -> void:
	self.hide()
	boite_diag.show()
	boite_diag.text = "Protag attaque !"
	back.show()

func _on_skills_pressed() -> void:
	self.hide()
	skills.get_chomeur_skills(chomeur.skills)
	skills.show()
	back.show()

func _on_items_pressed() -> void:
	self.hide()
	boite_diag.show()
	boite_diag.text = "Protag utilise un objet ..."
	back.show()

func _on_leave_pressed() -> void:
	pass # Replace with function body.

func _on_back_pressed() -> void:
	if skills.visible and !boite_diag.visible:
		skills.hide()
		back.hide()
		self.show()
		
	if boite_diag.visible and !skills.visible:
		boite_diag.hide()
		back.hide()
		self.show()

func _on_attack_mouse_entered() -> void:
	get_node("attack/attack_sp").texture = load("res://ressources/images/Sprite_bouton_2.png")
	
func _on_attack_mouse_exited() -> void:
	get_node("attack/attack_sp").texture = load("res://ressources/images/Sprite_bouton.png")

func _on_skills_mouse_entered() -> void:
	get_node("skills/skills_sp").texture = load("res://ressources/images/Sprite_bouton_2.png")

func _on_skills_mouse_exited() -> void:
	get_node("skills/skills_sp").texture = load("res://ressources/images/Sprite_bouton.png")

func _on_items_mouse_entered() -> void:
	get_node("items/items_sp").texture = load("res://ressources/images/Sprite_bouton_2.png")

func _on_items_mouse_exited() -> void:
	get_node("items/items_sp").texture = load("res://ressources/images/Sprite_bouton.png")

func _on_leave_mouse_entered() -> void:
	get_node("leave/leave_sp").texture = load("res://ressources/images/Sprite_bouton_2.png")

func _on_leave_mouse_exited() -> void:
	get_node("leave/leave_sp").texture = load("res://ressources/images/Sprite_bouton.png")
