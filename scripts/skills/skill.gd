class_name Skill
extends Resource

var skill_name: String = "Skill"
var description:String = "-"

var MP: int = 0
var accuracy: float = 1

var target_type: Global.target = Global.target.SINGLE_ENEMY
var logo: CompressedTexture2D = load("res://ressources/images/goat.png")

func cast_skill(from: Character, to: Array[Character]):
	pass
