class_name Fireball
extends Skill

func _init() -> void:
	target_type = Global.target.SINGLE_ENEMY
	skill_name = "Fireball"
	MP = 5
	accuracy = 0.9
	description = "Lance une boule de feu sur un ennemi. Peut infliger une Brûlure."
