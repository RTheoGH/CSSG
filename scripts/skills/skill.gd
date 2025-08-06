class_name Skill
extends Resource

var skill_name: String
var description:String

var MP: int
var accuracy: float

var target_type: Global.target

var logo: CompressedTexture2D = load("res://ressources/images/goat.png")

func cast_skill(from: Character, to: Array[Character]):
	pass
	
func get_class_name() -> String:
	return "Skill"
