extends Control
# Referências de nós
@onready var name_box = %LineEdit
@onready var class_selector: ClassSelector = $Class_Selector
@export var player_data: PlayerData

var player_name: String = ""

func _ready():
	$%Knight.pressed.connect(class_selector._on_knight_pressed)
	$%Mage.pressed.connect(class_selector._on_mage_pressed)
	
func _process(_delta):
	if name_box.text.is_empty():
		%Confirm.disabled = true
	else:
		%Confirm.disabled = false

func _on_confirm_pressed() -> void:
	# Passo 1: Pega o nome do jogador
	player_name = name_box.text.strip_edges()
	print("Nome: '%s' | Caracteres: %d" % [player_name, player_name.length()])
	
	# Passo 2: Obtém os dados do personagem
	var new_player_data = class_selector.get_player_data()
	new_player_data.player_name = player_name
	new_player_data.current_mission = get_random_mission("Valoria")

	
	# Passo 3: Salva os dados (chama a função de save)
	var save_path = save_player_data(new_player_data)  # Agora retorna o caminho
	
	# Passo 4: Carrega os dados salvos (opcional, só para verificação)
	player_data = load(save_path)
	print("Personagem criado: ", player_data)
	
	# Passo 5: Transição para a cena do jogo
	get_tree().change_scene_to_file("res://GameScreen/Game_Screen/Game.tscn")

func save_player_data(new_player_data: PlayerData) -> String:
	var safe_name = new_player_data.player_name.replace("/", "_").replace("\\", "_")
	
	var dir = DirAccess.open("user://")
	if not dir.dir_exists("saves"):
		dir.make_dir("saves")
	if not dir.dir_exists("saves/" + safe_name):
		dir.make_dir("saves/" + safe_name)
	
	var timestamp = Time.get_datetime_string_from_system().replace(":", "-")
	var save_path = "user://saves/%s/player_data_%s.tres" % [safe_name, timestamp]
	
	var error = ResourceSaver.save(new_player_data, save_path)
	if error == OK:
		print("Dados salvos em:", save_path)
		return save_path
	else:
		printerr("Erro ao salvar:", error)
		return ""

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://interface/main_menu/menu.tscn")


func get_random_mission(region: String) -> Dictionary:
	if Missions.has(region):
		var region_missions = Missions[region]
		if region_missions.size() > 0:
			var index = randi() % region_missions.size()
			return region_missions[index]
	return {}  # Caso não encontre missão
