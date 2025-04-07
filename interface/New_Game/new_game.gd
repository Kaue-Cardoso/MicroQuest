extends Control

# Referências de nós
@onready var name_box = $VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Name/TextEdit
@export var class_selector_path: NodePath  # Defina no inspector o caminho para o Class_Selector
@onready var class_selector = get_node(class_selector_path) as Class_Selector

# Variáveis de dados
var player_name: String = ""
var class_data: ClassData
var weapons_data: Array[WeaponData] = []
var skills_data: Array[SkillData] = []

func _ready():
	# Conecta o sinal de texto alterado
	name_box.text_changed.connect(_on_text_edit_text_changed)
	
	# Inicialização segura
	if not class_selector:
		printerr("Class_Selector não encontrado! Verifique o caminho.")

func _on_confirm_pressed() -> void:
	if validate_data():
		save_player_data()
		transition_to_game()
	else:
		show_error_message()

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://interface/main_menu/menu.tscn")

func _on_text_edit_text_changed(new_text: String) -> void:
	player_name = new_text.strip_edges()

# Funções principais
func validate_data() -> bool:
	# Verifica dados mínimos para iniciar o jogo
	return (
		player_name.length() >= 3 and
		class_selector.current_class != " " and
		!class_selector.cloned_class_data == null
	)

func save_player_data():
	# Coleta dados clonados do Class_Selector
	var cloned_data = class_selector.get_cloned_data()
	
	# Atualiza dados globais
	Global.player_data = {
		"player_name": player_name,
		"class_data": cloned_data["class"],
		"weapons_data": cloned_data["weapons"],
		"skills_data": cloned_data["skills"],
		"base_stats": get_base_stats(cloned_data["class"]),
		"current_stats": get_current_stats(cloned_data["class"])
	}

func get_base_stats(class_data: ClassData) -> Dictionary:
	return {
		"pvs": class_data.pvs,
		"pms": class_data.pms,
		"forca": class_data.forca,
		"destreza": class_data.destreza,
		"constituicao": class_data.constituicao,
		"inteligencia": class_data.inteligencia,
		"carisma": class_data.carisma
	}

func get_current_stats(class_data: ClassData) -> Dictionary:
	# Adiciona modificadores de equipamentos aqui se necessário
	return get_base_stats(class_data).duplicate()

func transition_to_game():
	# Transição com carregamento de dados
	ResourceLoader.load_threaded_request("res://GameScreen/Game_Screen/Game.tscn")
	await get_tree().create_timer(0.5).timeout  # Pequeno delay para carregamento
	if ResourceLoader.load_threaded_get_status("res://GameScreen/Game_Screen/Game.tscn") == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get("res://GameScreen/Game_Screen/Game.tscn"))
	else:
		show_loading_error()

# Funções de UI/Feedback
func show_error_message():
	var error_message = "Dados incompletos!\n"
	if player_name.length() < 3:
		error_message += "- Nome deve ter pelo menos 3 caracteres\n"
	if class_selector.current_class == " ":
		error_message += "- Selecione uma classe\n"
	
	# Implemente sua lógica de exibição de erro aqui
	print(error_message)

func show_loading_error():
	# Implemente uma UI de erro de carregamento
	print("Erro ao carregar a cena do jogo!")
