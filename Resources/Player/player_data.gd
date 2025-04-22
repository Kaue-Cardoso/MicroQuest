extends Resource
class_name PlayerData

@export var player_name: String = ""
@export var class_data: ClassData
@export var weapons: Array  # Agora armazena Resources diretamente
@export var inventory: InventoryData
#@export var skill_tree: SkillTreeData
@export var sprite_path: String = ""
var current_mission: Dictionary = {}
@export var mission_count = 0
func add_weapon(weapon: WeaponData):
	if not weapons.has(weapon):
		weapons.append(weapon)
