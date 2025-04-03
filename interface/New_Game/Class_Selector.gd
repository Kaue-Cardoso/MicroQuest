extends Node2D  

@onready var class_sprite = $Sprite2D  #Sprite Personagem
@onready var class_label = $"../../MarginContainer/VBoxContainer/Class"
@onready var type_value = $"../../MarginContainer/VBoxContainer/Type_Value"
@onready var pv_value =  $"../../../VBoxContainer/Pvs/PVs_Value"
@onready var pm_value = $"../../../VBoxContainer/PMs/PMs_Value"
@onready var forca_value = $"../../../VBoxContainer/Forca/Forca_Value"
@onready var destreza_value = $"../../../VBoxContainer/Destreza/Destreza_Value"
@onready var constituicao_value = $"../../../VBoxContainer/Constituicao/Constituicao_Value"
@onready var inteligencia_value = $"../../../VBoxContainer/Inteligencia/Inteligencia_Value"
@onready var carisma_value = $"../../../VBoxContainer/Carisma/Carisma_Value"
@onready var weapon1_name = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon1_Name"
@onready var weapon1_desc = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon1_Desc"
@onready var weapon2_name = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon2_Name"
@onready var weapon2_desc = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon2_Desc"
@onready var skill1_name = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill1_name"
@onready var skill1_desc = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill1_desc"
@onready var skill2_name = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill2_name"
@onready var skill2_desc = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill2_desc"
@onready var test = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/test"

var current_class = " "
var current_weapon = " "
var current_skill = " "

func _ready():
	weapon1_name.text = "Nenhuma arma equipada"
	skill1_name.text = "Sem Habilidades"

func _on_knight_pressed():
	current_class = "Knight"
	current_weapon = ["Sword"] as Array[String]
	current_skill = null
	update_character(current_class,current_weapon)

func _on_rogue_pressed():
	current_class = "Rogue"
	current_weapon = ["Dagger"] as Array[String]
	current_skill = ["Lucky", "Foul_Play"]
	update_character(current_class,current_weapon)

func _on_mage_pressed():
	current_class = "Mage"
	current_weapon = ["Staff"] as Array[String]
	current_skill = ["Fireball"]
	update_character(current_class,current_weapon)

func _on_paladin_pressed():
	current_class = "Paladin"
	current_weapon = ["Hammer"] as Array[String]
	current_skill = ["Heal"]
	update_character(current_class,current_weapon)

func _on_ranger_pressed():
	current_class = "Ranger"
	current_weapon = ["Bow"] as Array[String]
	current_skill = ["Escape"]
	update_character(current_class,current_weapon)

func _on_bard_pressed():
	current_class = "Bard"
	current_weapon = ["Lute"] as Array[String]
	current_skill = ["Lucky", "Sing"]
	update_character(current_class,current_weapon)

#  ################## Funções para exibir valores Char ###########################

func update_character(current_class, current_weapon):
	update_display_atributes(current_class)
	update_display_weapons(current_weapon)
	#update_display_skill(current_class)

func update_display_atributes(current_class):
	# Atualiza os atributos na interface
	var atributes_data: ClassData
	atributes_data = load("res://Resources/Class/"+ current_class + ".tres") as ClassData
	if atributes_data:
		class_sprite.texture = atributes_data.sprite
		class_label.text = atributes_data.nome_classe
		type_value.text = atributes_data.tipo
		pv_value.text = str(atributes_data.pvs)
		pm_value.text = str(atributes_data.pms)
		forca_value.text = str(atributes_data.forca)
		destreza_value.text = str(atributes_data.destreza)
		constituicao_value.text = str(atributes_data.constituicao)
		inteligencia_value.text = str(atributes_data.inteligencia)
		carisma_value.text = str(atributes_data.carisma)
	
	
func update_display_weapons(current_weapon: Array[String]):
	# Referências aos labels
	var weapon_labels = [weapon1_name, weapon2_name]
	var desc_labels = [weapon1_desc, weapon2_desc]

	# Limpa as labels antes de exibir
	for i in range(weapon_labels.size()):
		weapon_labels[i].text = "Nenhuma arma equipada" if i == 0 else ""
		desc_labels[i].text = ""

	# Preenche com os dados das armas equipadas
	for i in range(min(current_weapon.size(), weapon_labels.size())):
		var weapon_path = "res://Resources/Weapons/%s/%s_basic.tres" % [current_weapon[i], current_weapon[i]]
		var weapon_data: WeaponData = load(weapon_path) as WeaponData
			
		if weapon_data:
			weapon_labels[i].text = weapon_data.name
			desc_labels[i].text = weapon_data.description
			print(weapon_data.damage)
			print(weapon_data.type)
			print(weapon_data.type_combat)
		else:
			printerr("Erro ao carregar resource de arma:", weapon_path)
			weapon_labels[i].text = "Erro ao carregar"
			desc_labels[i].text = ""
	
func update_display_skill(current_skill):
	var skill_labels = [skill1_name, skill2_name]
	var desc_labels = [skill1_desc, skill2_desc]
	
	# Limpa as labels antes de exibir
	for i in range(skill_labels.size()):
		skill_labels[i].text = "Nenhuma Habilidade Aprendida" if i == 0 else ""
		desc_labels[i].text = ""
		
	# Preenche com os dados das armas equipadas
	for i in range(min(current_skill.size(), skill_labels.size())):
		var skill_path = "res://Resources/Skill/%s.tres" % [current_skill[i]]
		var skill_data: SkillData = load(skill_path) as SkillData
