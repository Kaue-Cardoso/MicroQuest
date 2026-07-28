extends Resource
class_name ClassData

@export_group("Visual")
@export var nome_classe: String = "Nome Classe"
@export_multiline var descricao_lore: String = "Descrição"
@export var tipo_classe: String = "Tipo"
@export var retrato: Texture2D # Imagem para o menu
@export var retrato_off: Texture2D # Sprite para o jogo
@export_file("*.tscn") var cena_personagem: String # Caminho do boneco in-game

@export_group("Atributos Base")
@export var hp_max: int = 100
@export var mp_max: int = 20
@export var forca: int = 10
@export var destreza: int = 8

@export_group("Equipamento Inicial")
# Aqui a mágica acontece: Uma lista de ItemData!
@export var armas_iniciais: Array[ItemData] = []
