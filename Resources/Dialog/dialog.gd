extends Control
class_name DialogScreen

var _step: float = 0.05
var _id: int = 0
var data: Dictionary = {}
var is_typing: bool = false  # Controla se o texto está sendo digitado

@export_category("Objects")
@export var _name: Label = null
@export var _dialog: RichTextLabel = null
@export var _faceset: TextureRect = null

func _ready() -> void:
	_initialize_dialog()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if is_typing:
			# Se o texto ainda está sendo digitado, pula direto para o fim
			_dialog.visible_characters = _dialog.get_total_character_count()
			is_typing = false
		else:
			# Se o texto já terminou, avança para a próxima fala
			_next_dialog()

func _initialize_dialog() -> void:
	_name.text = data[_id]["title"]
	_dialog.text = data[_id]["dialog"]
	_faceset.texture = load(data[_id]["faceset"])
	
	_dialog.visible_characters = 0
	is_typing = true
	_animate_text()

func _animate_text() -> void:
	while _dialog.visible_characters < _dialog.get_total_character_count():
		await get_tree().create_timer(_step).timeout
		_dialog.visible_characters += 1
	
	is_typing = false  # Texto terminado

func _next_dialog() -> void:
	_id += 1
	if _id >= data.size():
		queue_free()  # Remove o diálogo ao final
		get_parent().remove_child(self)  # Garante que ele saia da hierarquia
		return
	
	_initialize_dialog()
