extends Control
class_name ClassSelector

@onready var class_label = %Class
@onready var type_value = %Type_Value
@onready var lp_value = %LPs_Value
@onready var mp_value = %MPs_Value
@onready var strength_value = %Strength_Value
@onready var dexterity_value = %Dexterity_Value
@onready var constitution_value = %Constitution_Value
@onready var intelligence_value = %Intelligence_Value
@onready var charisma_value = %Charisma_Value
@onready var weapon1_name = $"../VBoxContainer/Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon1_Name"
@onready var weapon2_name = $"../VBoxContainer/Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon2_Name"
@onready var weapon1_desc = $"../VBoxContainer/Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon1_Desc"
@onready var weapon2_desc = $"../VBoxContainer/Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon2_Desc"
@onready var skill1_name = $"../VBoxContainer/Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill1_name"
@onready var skill2_name = $"../VBoxContainer/Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill2_name"
@onready var skill1_desc = $"../VBoxContainer/Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill1_desc"
@onready var skill2_desc = $"../VBoxContainer/Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill2_desc"

@onready var current_player: CharacterBody2D = %Character


var current_class = " "
var current_weapon = [" "]
var current_skill = [" "] as Array[String]
var atributes_data: ClassData

func _on_knight_pressed():
	current_class = "Knight"
	var sword_data = preload("res://resources/weapons/Sword/sword_basic.tres") as SwordData
	current_weapon = [sword_data]  # Armazena o recurso completo
	current_skill = [""] as Array[String]
	update_character()
	trocar_personagem("res://Resources/Class/Knight/knight.tscn")
	

#func _on_rogue_pressed():
	#current_class = "Rogue"
	#current_weapon = ["Dagger"] as Array[String]
	#current_skill = ["Lucky", "Foul_Play"] as Array[String]
	#print(current_class)
	#print(current_weapon)
	#print(current_skill)

func _on_mage_pressed():
	current_class = "Mage"
	var staff_data = preload("res://Resources/Weapons/Staff/staff_basic.tres") as StaffData
	current_weapon = [staff_data]  # Armazena o recurso completo
	current_skill = ["Fireball"] as Array[String]
	update_character()
	trocar_personagem("res://Resources/Class/Mage/mage.tscn")


#func _on_paladin_pressed():
	#current_class = "Paladin"
	#current_weapon = ["Hammer","Shield"] as Array[String]
	#current_skill = ["Heal"] as Array[String]
#
#func _on_ranger_pressed():
	#current_class = "Ranger"
	#current_weapon = ["Bow"] as Array[String]
	#current_skill = ["Escape"] as Array[String]
#
#func _on_bard_pressed():
	#current_class = "Bard"
	#current_weapon = ["Lute"] as Array[String]
	#current_skill = ["Lucky", "Sing"] as Array[String]

#  ################## Funções para exibir valores Personagem ###########################

func update_character():
	update_display_atributes()
	update_display_weapons()
	#update_display_skill()

func trocar_personagem(caminho_cena):
	# Remove o personagem atual
	var personagem_cena = load(caminho_cena)
	var novo_personagem = personagem_cena.instantiate()

 # Remove o antigo, se existir
	var holder = %Character
	if holder.get_child_count() > 0:
		holder.get_child(0).queue_free()

 # Adiciona o novo personagem
	holder.add_child(novo_personagem)
	
	# Roda a animação de idle
	if novo_personagem.has_node("Animation"):
		novo_personagem.get_node("Animation").play("idle")

func update_display_atributes():
	# Atualiza os atributos na interface
	atributes_data = load("res://Resources/Class/ClassData/"+ current_class + ".tres") as ClassData
	if atributes_data:
		#class_sprite.texture = atributes_data.sprite
		class_label.text = atributes_data.nome_classe
		type_value.text = atributes_data.tipo
		lp_value.text = str(atributes_data.lp)
		mp_value.text = str(atributes_data.mp)
		strength_value.text = str(atributes_data.strength)
		dexterity_value.text = str(atributes_data.dexterity)
		constitution_value.text = str(atributes_data.constitution)
		intelligence_value.text = str(atributes_data.intelligence)
		charisma_value.text = str(atributes_data.charisma)

func update_display_weapons():
	var weapon_labels = [weapon1_name, weapon2_name]
	var desc_labels = [weapon1_desc, weapon2_desc]

	for i in range(weapon_labels.size()):
		weapon_labels[i].text = "Nenhuma arma equipada" if i == 0 else ""
		desc_labels[i].text = ""

	for i in range(min(current_weapon.size(), weapon_labels.size())):
		var weapon = current_weapon[i]

		if weapon is SwordData:
			var sword: SwordData = weapon
			weapon_labels[i].text = sword.name
			desc_labels[i].text = "Description: %s" % sword.description

		elif weapon is StaffData:
			var staff: StaffData = weapon
			weapon_labels[i].text = staff.name
			desc_labels[i].text = "Description: %s" % staff.description

		else:
			weapon_labels[i].text = weapon.name
			desc_labels[i].text = weapon.description


#func update_display_skill():
	#var skill_labels = [skill1_name, skill2_name]
	#var desc_labels = [skill1_desc, skill2_desc]
#
	#
	## Limpa as labels antes de exibir
	#for i in range(skill_labels.size()):
		#skill_labels[i].text = "Nenhuma Habilidade Aprendida" if i == 0 else ""
		#desc_labels[i].text = ""
		#
	#
	## Preenche com os dados das armas equipadas	
	#for i in range(min(current_skill.size(), skill_labels.size())):
		#var skill_path = "res://Resources/Skill/%s.tres" % [current_skill[i]]
		#var skill_data: SkillData = load(skill_path) as SkillData
			#
		#if skill_data:
			#skill_labels[i].text = skill_data.name_skill
			#desc_labels[i].text = skill_data.description
				##print(skill_data.damage)
				##print(skill_data.type)
				##print(skill_data.type_damage)
		#else:
			#printerr("Erro ao carregar resource de arma:", skill_path)
			#skill_labels[i].text = "Erro ao carregar"
			#desc_labels[i].text = ""

func get_player_data() -> PlayerData:
	print("Resource: " ,current_weapon)
	var data = PlayerData.new()
	data.class_data = atributes_data
	data.weapons = current_weapon
	#data.skills = current_skill
	data.sprite_path = "res://Resources/Class/%s/%s.tscn" % [current_class, current_class.to_lower()]
	return data
