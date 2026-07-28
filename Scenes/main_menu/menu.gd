extends Control
class_name MainMenu

# 1. Caminhos Exportados: Permite que você arraste as cenas pelo Inspector.
# Se você mover os arquivos de lugar, o Godot atualiza automaticamente.
@export_file("*.tscn") var new_game_scene_path: String
@export_file("*.tscn") var load_game_scene_path: String

# 2. Referências aos Botões (Use "Access as Unique Name" no Editor para ficar mais limpo)
# No editor, clique com botão direito no nó do botão e marque "%Access as Unique Name"
@onready var btn_novo_jogo: Button = %NovoJogo
@onready var btn_carregar: Button = %Carregar
@onready var btn_sair: Button = %Sair

# Constante para o caminho do save (Idealmente isso ficaria num SaveManager global depois)
const SAVE_PATH: String = "user://savegame.save"

func _ready() -> void:
	# Toca a música (assumindo que seu Singleton funciona)
	if MusicController:
		MusicController.play_music()
	
	_setup_buttons()
	_check_save_file()
	
	# Opcional: Dar foco no botão de Novo Jogo para quem usa Teclado/Controle
	btn_novo_jogo.grab_focus()

func _setup_buttons() -> void:
	# Conectar sinais diretamente é mais seguro e performático que percorrer grupos
	# para um menu fixo e pequeno.
	btn_novo_jogo.pressed.connect(_on_new_game_pressed)
	btn_carregar.pressed.connect(_on_load_game_pressed)
	btn_sair.pressed.connect(_on_quit_pressed)

func _check_save_file() -> void:
	# Verifica se o arquivo existe de verdade no disco do usuário
	if not FileAccess.file_exists(SAVE_PATH):
		btn_carregar.disabled = true
		# Opcional: Mudar a cor ou opacidade para feedback visual extra
		btn_carregar.modulate.a = 0.5 
	else:
		btn_carregar.disabled = false
		btn_carregar.modulate.a = 1.0

# --- Funções de Callback (Separadas para clareza) ---

func _on_new_game_pressed() -> void:
	if new_game_scene_path:
		get_tree().change_scene_to_file("res://Scenes/class_selector/class_selector.tscn")
	else:
		push_error("ERRO: Caminho da cena de Novo Jogo não definido no Inspector!")

func _on_load_game_pressed() -> void:
	if load_game_scene_path:
		get_tree().change_scene_to_file(load_game_scene_path)
	else:
		push_error("ERRO: Caminho da cena de Carregar Jogo não definido no Inspector!")

func _on_quit_pressed() -> void:
	# Boa prática: Permitir que o sistema operacional lide com o fechamento
	# mas aqui forçamos o request de quit.
	get_tree().quit()
