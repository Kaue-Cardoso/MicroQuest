#extends Control
#
#@onready var save_list = %SaveList
#@export var player_data: PlayerData
#
#func _ready():
	#load_save_files()
#
#func load_save_files():
	#save_list.clear()
	#
	#var dir = DirAccess.open("user://saves")
	#if dir:
		#dir.list_dir_begin()
		#var folder_name = dir.get_next()
		#while folder_name != "":
			#if dir.current_is_dir() and folder_name != "." and folder_name != "..":
				#var subdir = DirAccess.open("user://saves/" + folder_name)
				#if subdir:
					#subdir.list_dir_begin()
					#var file_name = subdir.get_next()
					#while file_name != "":
						#if file_name.ends_with(".tres"):
							#var full_path = "user://saves/%s/%s" % [folder_name, file_name]
							#add_save_button(full_path)
						#file_name = subdir.get_next()
			#folder_name = dir.get_next()
#
#func add_save_button(path: String):
	#var button = Button.new()
	#button.text = path.get_file()
	#button.tooltip_text = path
	#button.pressed.connect(func(): _on_save_selected(path))
	#save_list.add_child(button)
#
#func _on_save_selected(path: String):
	#var data = load(path)
	#if data and data is PlayerData:
		#player_data = data
		#print("Save carregado com sucesso:", player_data.player_name)
		## Vai para a próxima cena (ou faz outra ação)
		#get_tree().change_scene_to_file("res://GameScreen/Game_Screen/Game.tscn")
	#else:
		#printerr("Falha ao carregar save:", path)
