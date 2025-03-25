extends Control
class_name MainMenu

var _has_save: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if _has_save == false:
		$ButtonsContainers/Carregar.disabled = true
		$ButtonsContainers/Carregar/Shadow.hide()
	for _button in get_tree().get_nodes_in_group("button"):
		_button.pressed.connect(_on_button_pressed.bind(_button))

func _on_button_pressed(_button: Button) -> void:
	match _button.name:
		"NovoJogo":
			get_tree().change_scene_to_file("res://interface/New_Game/New_Game.tscn")
		
		"Carregar":
			get_tree().change_scene_to_file("res://interface/Loaded_Game/Loaded_Game.tscn")
		
		"Sair":
			get_tree().quit()
			
