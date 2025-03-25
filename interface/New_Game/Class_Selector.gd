extends Node2D  

@onready var class_sprite = $Sprite2D  #Sprite Personagem
@onready var class_label = $"../../Class"
@onready var pv_value =  $"../../../VBoxContainer/Pvs/PVs_Value"
@onready var pm_value = $"../../../VBoxContainer/PMs/PMs_Value"
@onready var corpo_value = $"../../../VBoxContainer/Corpo/Corpo_Value"
@onready var mente_value = $"../../../VBoxContainer/Mente/Mente_Value"
@onready var espirito_value = $"../../../VBoxContainer/Espirito/Espirito_Value"
@onready var weapon1_name = $"../../../../../../../../Margin_Footer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon1"
@onready var weapon2_name = $"../../../../../../../../Margin_Footer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon2"
@onready var weapon3_name = $"../../../../../../../../Margin_Footer/VBoxContainer/V_Itens/M_Equipments_Values/H_Itens/V_Item/Weapon3"

var class_keys = []
var current_class = "Undefined"

func _ready():
	print("Tudo Ok")
	weapon1_name.text = "Nenhuma arma equipada"
	
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


#  ################## Funções para exibir valores Char ###########################

func update_character(current_class):
	update_display_sprite(current_class)
	update_display_atributes(current_class)
	update_display_weapons(current_class)

func update_display_sprite(current_class):
	# Atualiza o sprite
	class_sprite.texture = Global.class_collection[current_class]

func update_display_atributes(current_class):
	# Atualiza os atributos na interface
	Global.selected_values = Global.class_atributes[current_class]
	class_label.text = str(Global.selected_values["Nome_class"])
	pv_value.text = str(Global.selected_values["Pvs"])
	pm_value.text = str(Global.selected_values["Pms"])
	corpo_value.text = str(Global.selected_values["Corpo"])
	mente_value.text = str(Global.selected_values["Mente"])
	espirito_value.text = str(Global.selected_values["Espirito"])		

func update_display_weapons(current_class):
	weapon1_name.text = "Nenhuma arma equipada"
	weapon2_name.text = ""
	weapon3_name.text = ""

	
	if Global.class_weapons.has(current_class):
		var weapon_list = Global.class_weapons[current_class]  # Lista de armas da classe
		for i in range(weapon_list.size()):
			var weapon_name = weapon_list[i]
		
			if Global.weapons.has(weapon_name):
				var weapon_data = Global.weapons[weapon_name]
				print("Arma:", weapon_data["Nome"], "- Dano:", weapon_data["Dano"], "- Descrição:", weapon_data["Descrição"])

			# Atualiza o label de dano diretamente
				var weapon_label_name = "weapon" + str(i + 1) + "_name"  # Por exemplo: damage1_value, damage2_value, etc.
				var weapon_label = get(weapon_label_name)  # Acessa a variável diretamente

				if weapon_name:
					weapon_label.text = str(weapon_data["Nome"])
