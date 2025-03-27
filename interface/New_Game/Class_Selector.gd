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
@onready var weapon1_name = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon1"
@onready var weapon2_name = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon2"
@onready var weapon3_name = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon3"
@onready var skill1_name = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill1"
@onready var skill2_name = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill2"
@onready var skill3_name = $"../../../../../../../../Margin_Footer/MarginContainer/VBoxContainer/V_Skills/MarginContainer2/H_Skills/V_Skill_Name/Skill3"

var class_keys = []
var current_class = "Undefined"

func _ready():
	print("Tudo Ok")
	weapon1_name.text = "Nenhuma arma equipada"
	skill1_name.text = "Sem Habilidades"
	
func set_sprite_keys():
	class_keys = Global.class_collection.keys()
	
# Botões de seleção de personagens
func _on_knight_pressed():
	current_class = "Knight"
	update_character(current_class)

func _on_rogue_pressed():
	current_class = "Rogue"
	update_character(current_class)

func _on_mage_pressed():
	current_class = "Mage"
	update_character(current_class)

func _on_paladin_pressed() -> void:
	current_class = "Paladin"
	update_character(current_class)

func _on_ranger_pressed() -> void:
	current_class = "Ranger"
	update_character(current_class)

func _on_bard_pressed() -> void:
	current_class = "Bard"
	update_character(current_class)

#  ################## Funções para exibir valores Char ###########################

func update_character(current_class):
	update_display_sprite(current_class)
	update_display_atributes(current_class)
	update_display_weapons(current_class)
	update_display_skill(current_class)

func update_display_sprite(current_class):
	# Atualiza o sprite
	class_sprite.texture = Global.class_collection[current_class]

func update_display_atributes(current_class):
	# Atualiza os atributos na interface
	Global.selected_values = Global.class_atributes[current_class]
	class_label.text = str(Global.selected_values["Nome_class"])
	type_value.text = str(Global.selected_values["Tipo"])
	pv_value.text = str(Global.selected_values["Pvs"])
	pm_value.text = str(Global.selected_values["Pms"])
	forca_value.text = str(Global.selected_values["Forca"])
	destreza_value.text = str(Global.selected_values["Destreza"])
	constituicao_value.text = str(Global.selected_values["Constituicao"])
	inteligencia_value.text = str(Global.selected_values["Inteligencia"])
	carisma_value.text = str(Global.selected_values["Carisma"])

func update_display_weapons(current_class):
	# Define os valores padrão para as labels de armas
	weapon1_name.text = "Nenhuma arma equipada"  # Exibe essa mensagem caso a classe não tenha armas
	weapon2_name.text = ""  # Esvazia os campos das outras armas
	weapon3_name.text = ""	
	# Verifica se a classe tem armas associadas no dicionário Global.class_weapons
	if Global.class_weapons.has(current_class):
		var weapon_list = Global.class_weapons[current_class]  # Obtém a lista de armas da classe
		# Percorre a lista de armas usando um loop baseado no tamanho da lista
		for i in range(weapon_list.size()):
			var weapon_name = weapon_list[i]  # Obtém o nome da arma pelo índice atual
			# Verifica se essa arma está registrada no dicionário Global.weapons
			if Global.weapons.has(weapon_name):
				var weapon_data = Global.weapons[weapon_name]  # Obtém os dados da arma
				# Exibe as informações da arma no console (debug)
				print("Arma:", weapon_data["Nome"], "- Dano:", weapon_data["Dano"], "- Descrição:", weapon_data["Descrição"])
				# Monta dinamicamente o nome da variável correspondente ao slot da arma
				var weapon_label_name = "weapon" + str(i + 1) + "_name"  # Exemplo: weapon1_name, weapon2_name, weapon3_name
				# Usa 'get()' para acessar a variável pelo nome dinâmico
				var weapon_label = get(weapon_label_name)
				# Verifica se conseguiu encontrar a variável antes de alterar seu texto
				if weapon_label:
					weapon_label.text = str(weapon_data["Nome"])  # Atualiza o nome da arma na interface

func update_display_skill(current_class):
	# Define os valores padrão para as labels de armas
	skill1_name.text = "Sem Habilidades"  # Exibe essa mensagem caso a classe não tenha armas
	skill2_name.text = ""  # Esvazia os campos das outras armas
	skill3_name.text = ""
	# Verifica se a classe tem armas associadas no dicionário Global.class_weapons
	if Global.class_skills.has(current_class):
		var skills_list = Global.class_skills[current_class]  # Obtém a lista de armas da classe
		# Percorre a lista de armas usando um loop baseado no tamanho da lista
		for i in range(skills_list.size()):
			var skill_name = skills_list[i]  # Obtém o nome da arma pelo índice atual
			# Verifica se essa arma está registrada no dicionário Global.weapons
			if Global.skills.has(skill_name):
				var skill_data = Global.skills[skill_name]  # Obtém os dados da arma
				# Exibe as informações da arma no console (debug)
				print("Skill:", skill_data["Nome"], "- Dano:", skill_data["Dano"], "- Descrição:", skill_data["Descrição"])
				# Monta dinamicamente o nome da variável correspondente ao slot da arma
				var skill_label_name = "skill" + str(i + 1) + "_name"  # Exemplo: weapon1_name, weapon2_name, weapon3_name
				# Usa 'get()' para acessar a variável pelo nome dinâmico
				var skill_label = get(skill_label_name)
				# Verifica se conseguiu encontrar a variável antes de alterar seu texto
				if skill_label:
					skill_label.text = str(skill_data["Nome"])  # Atualiza o nome da arma na interface
