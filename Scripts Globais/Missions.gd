extends Node

# Estrutura das missões
var missions = {
	"Arendal": [
		{
		"id": "01", 
		"title": "Goblins Ladrões", 
		"desc": "Derrote um grupo de goblins que estão atacando comerciantes.",
		"reward": {
			"type": "weapon",
			"name": "Cimitarra"
		},
		"dates": 8,
		"Boss": "Goblin King"
		},
		{
		"id": "02", 
		"title": "Colher a Black Lotus", 
		"desc": "Encontra a Black Lotus, uma rara flor capaz de curar qualquer doença.",
		"reward": {
			"type": "Skill",
			"name": "Heal"
		},
		"dates": 12,
		"Boss": "Nothing"
		}
	],
	"Najir": [
		{
		"id": "01", 
		"title": "Goblins Ladrões", 
		"desc": "Derrote um grupo de goblins que estão atacando comerciantes.",
		"reward": {
			"type": "weapon",
			"name": "Cimitarra"
		},
		"dates": 8,
		"Boss": "Goblin King"
		},
		{
		"id": "02", 
		"title": "Colher a Black Lotus", 
		"desc": "Encontra a Black Lotus, uma rara flor capaz de curar qualquer doença.",
		"reward": {
			"type": "Skill",
			"name": "Heal"
		},
		"dates": 12,
		"Boss": "Nothing"
		}
	],
	"Durant": [
		{
		"id": "01", 
		"title": "Goblins Ladrões", 
		"desc": "Derrote um grupo de goblins que estão atacando comerciantes.",
		"reward": {
			"type": "weapon",
			"name": "Cimitarra"
		},
		"dates": 8,
		"Boss": "Goblin King"
		},
		{
		"id": "02", 
		"title": "Colher a Black Lotus", 
		"desc": "Encontra a Black Lotus, uma rara flor capaz de curar qualquer doença.",
		"reward": {
			"type": "Skill",
			"name": "Heal"
		},
		"dates": 12,
		"Boss": "Nothing"
		}
	],
	"Gaalam": [
		{
		"id": "01", 
		"title": "Goblins Ladrões", 
		"desc": "Derrote um grupo de goblins que estão atacando comerciantes.",
		"reward": {
			"type": "weapon",
			"name": "Cimitarra"
		},
		"dates": 8,
		"Boss": "Goblin King"
		},
		{
		"id": "02", 
		"title": "Colher a Black Lotus", 
		"desc": "Encontra a Black Lotus, uma rara flor capaz de curar qualquer doença.",
		"reward": {
			"type": "Skill",
			"name": "Heal"
		},
		"dates": 12,
		"Boss": "Nothing"
		}
	]
}

var current_mission = null
var mission_count = 0

# Seleciona uma missão aleatória com base no número de missões concluídas
func select_mission():
	if mission_count == 0:
		current_mission = missions["Arendal"].pick_random()
	elif mission_count == 1:
		current_mission = missions["Najir"].pick_random()
	elif mission_count == 2:
		current_mission = missions["Durant"].pick_random()
	elif mission_count == 3:
		current_mission = missions["Gaalam"].pick_random()
	
	mission_count += 1
	return current_mission

# Método para iniciar uma missão
func start_mission():
	if current_mission:
		print("Missão Atual: ", current_mission["title"])
		print("Descrição: ", current_mission["desc"])
		# Aqui podemos chamar o sistema de diálogo e iniciar a missão no jogo
