extends Control

@onready var class_label: Label = %Class
@onready var type_label: Label = %Type_Value
@onready var l_ps_value: Label = %LPs_Value
@onready var m_ps_value: Label = %MPs_Value
@onready var strength_value: Label = %Strength_Value
@onready var dexterity_value: Label = %Dexterity_Value
@onready var constitution_value: Label = %Constitution_Value
@onready var intelligence_value: Label = %Intelligence_Value
@onready var charisma_value: Label = %Charisma_Value

func _ready() -> void:
	pass

# --- NOVA FUNÇÃO ---
# Esta é a função que o Grid vai chamar/conectar
func update_info_labels(data: ClassData) -> void:
	
	if not is_node_ready(): 
		await ready # Aguarda o sinal de ready antes de continuar
	# Atualiza textos simples
	class_label.text = data.nome_classe # Verifique o nome da variável no seu .tres
	# Se tiver um campo 'type' no resource:
	type_label.text = data.tipo_classe
	
	# Atualiza valores numéricos (precisa converter para String com str())
	l_ps_value.text = str(data.hp_max) # Ajuste os nomes conforme seu Resource
	m_ps_value.text = str(data.mp_max)
	
	strength_value.text = str(data.forca)
	dexterity_value.text = str(data.destreza)
	#constitution_value.text = str(data.constitution)
	#intelligence_value.text = str(data.intelligence)
	#charisma_value.text = str(data.charisma)
	
func _on_class_selected(data: ClassData) -> void:
	print("Classe selecionada: ", data.nome_classe)
	
	# EXEMPLO DO QUE FAZER AQUI:
	# 1. Salvar a escolha em um Singleton/Global
	# GameManager.player_class = data
	
	# 2. Mudar para a cena do jogo
	# get_tree().change_scene_to_file("res://scenes/level_01.tscn")
