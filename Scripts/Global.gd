extends Node

var selected_class = ""
var selected_values = {}  # Armazena os atributos da classe escolhida

var skills = {
	"Fireball": {
		"Nome": "Bola de Fogo",
		"Custo": 2,
		"Dano": 4,
		"Cura": 0,
		"Descrição": "Lança uma bola de fogo contra o inimigo, causando dano mágico."
	},
	"Heal": {
		"Nome": "Cura Básica",
		"Custo": 2,
		"Dano": 0,
		"Cura": 3,
		"Descrição": "Restaura a vida com poder divino."
	},
	"Lucky": {
		"Nome": "Sortudo",
		"Custo": 0,
		"Dano": 0,
		"Cura": 0,
		"Descrição": "O personagem possui uma chance maior de encontrar tesouros."
	}
}

var weapons = {
	"Sword": {
		"Nome": "Espada",
		"Dano": 3,
		"Descrição": "Espada padrão."
	},
	"Dagger": {
		"Nome": "Adagas",
		"Dano": 2,
		"Descrição": "Um belo par de adagas."
	},
	"Staff": {
		"Nome": "Cajado",
		"Dano": 1,
		"Descrição": "Um belo toco de árvore tratado."
	}
}

var class_collection = {
	"Undefined": preload("res://Assets/Char/Sprite/Undefined.png"),
	"Knight": preload("res://Assets/Char/Sprite/Knight.png"),
	"Rogue": preload("res://Assets/Char/Sprite/Rogue.png"),
	"Mage": preload("res://Assets/Char/Sprite/Mage.png")
}

var class_atributes = {
	"Undefined": {"Nome_class": "Desconhecido", "Pvs": 0, "Pms": 0, "Corpo": 0, "Mente": 0, "Espirito": 0 },
	"Knight": {"Nome_class": "Cavaleiro", "Pvs": 14, "Pms": 0, "Corpo": 3, "Mente": 1, "Espirito": 1 },
	"Rogue": {"Nome_class": "Ladino", "Pvs": 10, "Pms": 0, "Corpo": 1, "Mente": 3, "Espirito": 1 },
	"Mage": {"Nome_class": "Mago", "Pvs": 08, "Pms": 10, "Corpo": 1, "Mente": 1, "Espirito": 3 }	
}

var class_skills = {
	"Knight": [],
	"Rogue": ["Lucky", "Fireball"],
	"Mage": ["Fireball"]
}

var class_weapons = {
	"Knight": ["Sword","Dagger"],
	"Rogue": ["Dagger"],
	"Mage": ["Staff"]
}
