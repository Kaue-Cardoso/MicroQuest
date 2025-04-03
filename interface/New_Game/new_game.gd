extends Control

@onready var name_box = $VBoxContainer/Margin_Content/H_Interactive/HContainerValues/V_Align/H_Name/TextEdit
var player_name = " "



func _on_confirm_pressed() -> void:
	get_tree().change_scene_to_file("res://GameScreen/Game_Screen/Game.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://interface/main_menu/menu.tscn")

func _on_text_edit_text_changed() -> void:
	player_name = name_box.text
