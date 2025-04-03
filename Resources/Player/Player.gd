extends CharacterBody2D

@onready var sprite = $Skeleton/Class
@onready var name_label = $Skeleton/Name
var espada_flamejante_data: SwordData


var player_values ={
	
	class_collection = {
		"Undefined": preload("res://Assets/Char/Sprite/Bard.png")
	},
	class_atributes = {
		"Undefined": {"Nome_class": "Desconhecido","Tipo": "Nenhum", "Pvs": 0, "Pms": 0, "Forca": 0, "Destreza": 0,"Constituicao": 0, "Inteligencia": 0, "Carisma": 0 }	
	},
	class_initial_skills = { #antigo class_skill
		"Undefined": []
	},
	class_weapons = {
		"Undefined": [" "]
	}
	
}

#func _ready() -> void:
	#for key in player_values.keys():
		#var value = player_values[key]
		#print(key, ": ", value)
	#initialize_player()
	
#func initialize_player():
	#var class_texture = player_values.class_collection.get("Undefined", null)
	#if class_texture:
		#sprite.texture = class_texture
	#else:
		#print("Textura não encontrada para a classe ")
