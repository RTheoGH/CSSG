class_name SkillSelect
extends ColorRect

var boutons : Array[Button]
var skills : Array[Skill]

#func _init(s: Array[Skill]) -> void:
	#skills = s
	
		
func _ready() -> void:
	pass

func get_chomeur_skills(liste):
	skills = liste
	var get_skills = get_parent().get_node("SkillSelect")
	print(get_skills)
	var skill1 = get_skills.get_node("Skill1")
	var skill2 = get_skills.get_node("Skill2")
	var skill3 = get_skills.get_node("Skill3")
	var skill4 = get_skills.get_node("Skill4")
	print([skill1, skill2, skill3, skill4])
	#for i in range(get_tree().size()):
		#print(get_children())
	boutons = [skill1, skill2, skill3, skill4]
	var sl := skills.size() if skills.size() < boutons.size() else boutons.size()
	for i in range(sl):
		boutons[i].text = skills[i].get_class_name()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
