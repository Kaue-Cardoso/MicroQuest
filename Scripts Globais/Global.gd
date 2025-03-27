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
		"Cura": 4,
		"Descrição": "Restaura a vida com poder divino."
	},
	"Lucky": {
		"Nome": "Sortudo",
		"Custo": 0,
		"Dano": 0,
		"Cura": 0,
		"Descrição": "O personagem possui uma chance maior de encontrar tesouros."
	},
	"Foul Play": {
		"Nome": "Jogo Sujo",
		"Custo": 2,
		"Dano": 3,
		"Cura": 0,
		"Descrição": "O personagem joga areia nos olhos do oponente e o atacar pelas costas."
	},
	"Escape": {
		"Nome": "Escapada",
		"Custo": 2,
		"Dano": 0,
		"Cura": 0,
		"Descrição": "O personagem pode evadir de armadilhas."
	},
	"Sing": {
		"Nome": "Canto",
		"Custo": 2,
		"Dano": 2,
		"Cura": 0,
		"Descrição": "O personagem encanta o inimigo com uma grave melodia."
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
	},
	"Hammer": {
		"Nome": "Martelo",
		"Dano": 3,
		"Descrição": "Amassando tudo e todos desde 3000 A.C."
	},
	"Shield": {
		"Nome": "Escudo",
		"Dano": 1,
		"Descrição": "Confere uma otima proteção"
	},
	"Bow": {
		"Nome": "Arco",
		"Dano": 3,
		"Descrição": "Capaz de acertar até uma minuscula mosca"
	},
	"Lute": {
		"Nome": "Alaude",
		"Dano": 2,
		"Descrição": "Capaz de criar uma linda melodia"
	}
}

var class_collection = {
	"Undefined": preload("res://Assets/Char/Sprite/Undefined.png"),
	"Knight": preload("res://Assets/Char/Sprite/Knight.png"),
	"Rogue": preload("res://Assets/Char/Sprite/Rogue.png"),
	"Mage": preload("res://Assets/Char/Sprite/Mage.png"),
	"Paladin": preload("res://Assets/Char/Sprite/Undefined.png"),
	"Ranger": preload("res://Assets/Char/Sprite/Undefined.png"),
	"Bard": preload("res://Assets/Char/Sprite/Undefined.png")
}

var class_atributes = {
	"Undefined": {"Nome_class": "Desconhecido", "Pvs": 0, "Pms": 0, "Forca": 0, "Destreza": 0,"Constituicao": 0, "Inteligencia": 0, "Carisma": 0 },
	"Knight": {"Nome_class": "Cavaleiro","Tipo": "Fisico" , "Pvs": 12, "Pms": 6, "Forca": 3, "Destreza": 2,"Constituicao": 3, "Inteligencia": 1, "Carisma": 1},
	"Rogue": {"Nome_class": "Ladino","Tipo": "Fisico", "Pvs": 10, "Pms": 6, "Forca": 2, "Destreza": 4,"Constituicao": 2, "Inteligencia": 1, "Carisma": 1 },
	"Mage": {"Nome_class": "Mago","Tipo": "Magico" , "Pvs": 08, "Pms": 14, "Forca": 1, "Destreza": 1,"Constituicao": 1, "Inteligencia": 4, "Carisma": 2 },
	"Paladin": {"Nome_class": "Paladino","Tipo": "Misto" , "Pvs": 14, "Pms": 8, "Forca": 2, "Destreza": 1,"Constituicao": 4, "Inteligencia": 2, "Carisma": 1 },
	"Ranger": {"Nome_class": "Patrulheiro","Tipo": "Fisico" , "Pvs": 10, "Pms": 6, "Forca": 1, "Destreza": 3,"Constituicao": 2, "Inteligencia": 1, "Carisma": 3 },
	"Bard": {"Nome_class": "Bardo","Tipo": "Magico", "Pvs": 8, "Pms": 8, "Forca": 1, "Destreza": 2,"Constituicao": 1, "Inteligencia": 2, "Carisma": 4 }	
}

var class_skills = {
	"Knight": [],
	"Rogue": ["Lucky", "Foul Play"],
	"Mage": ["Fireball"],
	"Paladin": ["Heal"],
	"Ranger": ["Escape"],
	"Bard": ["Lucky" ,"Sing"]
}

var class_weapons = {
	"Knight": ["Sword"],
	"Rogue": ["Dagger"],
	"Mage": ["Staff"],
	"Paladin": ["Hammer", "Shield"],
	"Ranger": ["Bow"],
	"Bard": ["Lute"],
}
