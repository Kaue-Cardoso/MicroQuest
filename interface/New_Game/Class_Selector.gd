extends Control
class_name ClassSelector

@onready var class_label = %Class
@onready var type_value = %Type_Value
@onready var lp_value = $"../VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Sprite_Atributes/VBoxContainer/LPs/LPs_Value" 
@onready var mp_value = $"../VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Sprite_Atributes/VBoxContainer/MPs/MPs_Value"
@onready var strength_value = $"../VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Sprite_Atributes/VBoxContainer/Strength/Strength_Value"
@onready var dexterity_value = $"../VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Sprite_Atributes/VBoxContainer/Dexterity/Dexterity_Value"
@onready var constitution_value = $"../VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Sprite_Atributes/VBoxContainer/Constitution/Constitution_Value"
@onready var intelligence_value = $"../VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Sprite_Atributes/VBoxContainer/Intelligence/Intelligence_Value"
@onready var charisma_value = $"../VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Sprite_Atributes/VBoxContainer/Charisma/Charisma_Value"


@onready var current_player: CharacterBody2D = $"../VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Sprite_Atributes/V_Sprite/Test"


var current_class = " "
var current_weapon = " "
var current_skill = [" "]

func _on_knight_pressed():
	current_class = "Knight"
	current_weapon = ["Sword"]
	current_skill = [""]
	update_character()
	trocar_personagem("res://Resources/Class/ClassData/Knight/knight.tscn")
	

func _on_rogue_pressed():
	current_class = "Rogue"
	current_weapon = ["Dagger"] as Array[String]
	current_skill = ["Lucky", "Foul_Play"] as Array[String]
	print(current_class)
	print(current_weapon)
	print(current_skill)

func _on_mage_pressed():
	current_class = "Mage"
	current_weapon = ["Staff"] as Array[String]
	current_skill = ["Fireball"] as Array[String]
	print(current_class)
	print(current_weapon)
	print(current_skill)
	update_character()
	trocar_personagem("res://Resources/Class/ClassData/Mage/mage.tscn")


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
	update_display_atributes(current_class)
	#update_display_weapons(current_weapon)
	#update_display_skill(current_skill)

func trocar_personagem(caminho_cena):
	# Remove o personagem atual
	var personagem_cena = load(caminho_cena)
	var novo_personagem = personagem_cena.instantiate()

 # Remove o antigo, se existir
	var holder = $"../VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Sprite_Atributes/V_Sprite/Test"
	if holder.get_child_count() > 0:
		holder.get_child(0).queue_free()

 # Adiciona o novo personagem
	holder.add_child(novo_personagem)
	
	# Roda a animação de idle
	if novo_personagem.has_node("Animation"):
		novo_personagem.get_node("Animation").play("idle")

func update_display_atributes(current_class):
	# Atualiza os atributos na interface
	var atributes_data: ClassData
	atributes_data = load("res://Resources/Class/"+ current_class + ".tres") as ClassData
	if atributes_data:
		#class_sprite.texture = atributes_data.sprite
		class_label.text = atributes_data.nome_classe
		type_value.text = atributes_data.tipo
		#pv_value.text = str(atributes_data.pvs)
		#pm_value.text = str(atributes_data.pms)
		#forca_value.text = str(atributes_data.forca)
		#destreza_value.text = str(atributes_data.destreza)
		#constituicao_value.text = str(atributes_data.constituicao)
		#inteligencia_value.text = str(atributes_data.inteligencia)
		#carisma_value.text = str(atributes_data.carisma)
#
