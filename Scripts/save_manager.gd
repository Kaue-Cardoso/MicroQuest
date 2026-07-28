extends Node
#
#const SAVE_DIR = "user://saves/"
#
#func save_game(slot: int):
	#var save_path = SAVE_DIR + "save_%d.dat" % slot
	#var data = {
		#"version": "1.0",
		#"player_data": Global.player_data
	#}
	#var file = FileAccess.open_encrypted_with_pass(save_path, FileAccess.WRITE, "sua_senha")
	#file.store_var(data)
#
#func load_game(slot: int):
	#var save_path = SAVE_DIR + "save_%d.dat" % slot
	#if FileAccess.file_exists(save_path):
		#var file = FileAccess.open_encrypted_with_pass(save_path, FileAccess.READ, "sua_senha")
		#return file.get_var()
	#return null
