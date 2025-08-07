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
	#for i in range(get_tree().size()):
		#print(get_children())
	boutons = [$Skill1, $Skill2, $Skill3, $Skill4]
	var sl := skills.size() if skills.size() < boutons.size() else boutons.size()
	for i in range(sl):
		boutons[i].text = skills[i].skill_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_skill_1_mouse_entered() -> void:
	if(skills.size() < 1):
		return
	$DescriptionRight/RichTextLabel.text = skills[0].description + "\nMP : " + str(skills[0].MP) + "\tAccuracy : " + str(skills[0].accuracy*100)+"%"
	$DescriptionRight.visible = true

func _on_skill_1_mouse_exited() -> void:
	$DescriptionRight.visible = false


func _on_skill_2_mouse_entered() -> void:
	if(skills.size() < 2):
		return
	$DescriptionRight/RichTextLabel.text = skills[1].description + "\nMP : " + str(skills[1].MP) + "\tAccuracy : " + str(skills[1].accuracy*100)+"%"
	$DescriptionRight.visible = true

func _on_skill_2_mouse_exited() -> void:
	$DescriptionRight.visible = false

func _on_skill_3_mouse_entered() -> void:
	if(skills.size() < 3):
		return
	$DescriptionLeft/RichTextLabel.text = skills[2].description + "\nMP : " + str(skills[2].MP) + "\tAccuracy : " + str(skills[2].accuracy*100)+"%"
	$DescriptionLeft.visible = true

func _on_skill_3_mouse_exited() -> void:
	$DescriptionLeft.visible = false

func _on_skill_4_mouse_entered() -> void:
	if(skills.size() < 4):
		return
	$DescriptionLeft/RichTextLabel.text = skills[3].description + "\nMP : " + str(skills[3].MP) + "\tAccuracy : " + str(skills[3].accuracy*100)+"%"
	$DescriptionLeft.visible = true

func _on_skill_4_mouse_exited() -> void:
	$DescriptionLeft.visible = false
