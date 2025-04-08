extends Control

# Referências de nós
@onready var name_box = $VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Name/TextEdit
@onready var class_selector: ClassSelector = $Class_Selector


var player_name: String = ""

func _ready():
	$VBoxContainer/Margin_Content/H_Interactive/Grid_Sprites/Background/MarginContainer/Knight.pressed.connect(class_selector._on_knight_pressed)
	$VBoxContainer/Margin_Content/H_Interactive/Grid_Sprites/Background3/MarginContainer/Mage.pressed.connect(class_selector._on_mage_pressed)

func _on_confirm_pressed() -> void:
	player_name = name_box.text.strip_edges()
	print("Nome: '%s' | Caracteres: %d" % [player_name, player_name.length()])
	#get_tree().change_scene_to_file("res://GameScreen/Game_Screen/Game.tscn")
	
	#if validate_data():
		#save_player_data()	
	#else:
		#show_error_message()

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://interface/main_menu/menu.tscn")

#func save_player_data():

#func save_player_data():
	 ## Cria uma nova instância de PlayerData
	#var player_data = PlayerData.new()
	#player_data.initialize_from_selection(class_selector, player_name)
	#
	## Atualiza o Global
	#Global.current_player = player_data
	#
	## Opcional: Salva imediatamente
	##SaveManager.save_game(0, player_data.serialize())
#
#func get_current_stats() -> Dictionary:
	## Carrega os stats base da classe
	#var class_data = load("res://Resources/Class/%s.tres" % class_selector.current_class) as ClassData
	#if class_data:
		#return {
			#"pvs": class_data.pvs,
			#"pms": class_data.pms,
			#"forca": class_data.forca,
			#"destreza": class_data.destreza,
			#"constituicao": class_data.constituicao,
			#"inteligencia": class_data.inteligencia,
			#"carisma": class_data.carisma
		#}
	#return {}
#
## Funções de UI/Feedback
#func show_error_message():
	#var error_message = "Dados incompletos!\n"
	#if player_name.length() < 3:
		#error_message += "- Nome deve ter pelo menos 3 caracteres\n"
	#if class_selector.current_class == " ":
		#error_message += "- Selecione uma classe\n"
	#
	## Exemplo básico de feedback - implemente sua UI aqui
	#print(error_message)
	## Ou: $ErrorLabel.text = error_message
	## $ErrorAnimation.play("show_error")
