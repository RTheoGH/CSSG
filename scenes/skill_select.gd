class_name SkillSelect
extends ColorRect

var boutons : Array[Button]
var skills : Array[Skill]

func _init(s: Array[Skill]) -> void:
	skills = s
	
		
func _ready() -> void:
	boutons = [$Skill1, $Skill2, $Skill3, $Skill4]
	var sl := skills.size() if skills.size() < boutons.size() else boutons.size()
	for i in range(sl):
		boutons[i].text = skills[i].get_class_name()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
