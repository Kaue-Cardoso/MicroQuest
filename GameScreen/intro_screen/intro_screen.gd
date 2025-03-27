extends Node2D
class_name intro_screen

const _DIALOG_SCREEN: PackedScene = preload("res://Resources/Dialog/Dialog.tscn")

var _dialog_data: Dictionary = {
	0: {
		"faceset": "res://Assets/Char/Sprite/King.png",
		"dialog": "Ai minhas amoras, meu deus... Minhas amoras, aaaahhhhhhhh",
		"title": "Reei"
	},
	1: {
		"faceset": "res://Assets/Char/Sprite/Princess.png",
		"dialog": "Eu sou muito linda, sim sim, muuitoo liindaa",
		"title": "Princesa Linda"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

var active_dialog: DialogScreen = null  # Guarda a referência do diálogo atual

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and active_dialog == null:
		active_dialog = _DIALOG_SCREEN.instantiate()
		active_dialog.data = _dialog_data
		_hud.add_child(active_dialog)
		active_dialog.connect("tree_exited", Callable(self, "_on_dialog_closed"))

func _on_dialog_closed() -> void:
	active_dialog = null  # Reseta a variável quando o diálogo for fechado
