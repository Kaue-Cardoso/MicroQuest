extends Resource
class_name InventoryData

## --------------------------------------------
## 1. CONFIGURAÇÕES INICIAIS
## --------------------------------------------

# Tipos de slots disponíveis
enum SlotType {
	HEAD,       # Armadura (Cabeça)
	CHEST,      # Armadura (Peito)
	LEGS,       # Armadura (Pernas)
	PRIMARY,    # Arma Principal
	SECONDARY,  # Arma Secundária
	RING,       # Acessório (Anel)
	AMULET      # Acessório (Amuleto)
}

# Mapeamento de slots para tipos esperados
var _slot_requirements = {
	SlotType.HEAD: "ArmorData",
	SlotType.CHEST: "ArmorData",
	SlotType.LEGS: "ArmorData",
	SlotType.PRIMARY: "WeaponData",
	SlotType.SECONDARY: "WeaponData",
	SlotType.RING: "JewelryData",
	SlotType.AMULET: "JewelryData"
}

## --------------------------------------------
## 2. VARIÁVEIS DO INVENTÁRIO
## --------------------------------------------

# Itens equipados
@export var head: ArmorData = null
@export var chest: ArmorData = null
@export var legs: ArmorData = null
@export var primary_weapon: WeaponData = null
@export var secondary_weapon: WeaponData = null
#@export var ring: JewelryData = null
#@export var amulet: JewelryData = null

# Mochila (itens não equipados)
@export var backpack: Array[ItemData] = []

# Sinalização
signal equipment_updated(slot: SlotType, item: ItemData)
signal backpack_updated(index: int, item: ItemData)

## --------------------------------------------
## 3. LÓGICA PRINCIPAL
## --------------------------------------------

# Equipa um item em um slot específico
func equip_item(slot: SlotType, item: ItemData) -> bool:
	# Verifica se o item é válido para o slot
	if not _is_valid_for_slot(slot, item):
		push_error("Item inválido para o slot ", _get_slot_name(slot), ": ", item.get_class())
		return false
	
	# Remove o item atual do slot (se houver) e adiciona à mochila
	var previous_item = _get_slot_item(slot)
	_set_slot_item(slot, item)
	
	if previous_item:
		add_to_backpack(previous_item)
	
	# Notifica a UI
	emit_signal("equipment_updated", slot, item)
	return true

# Adiciona item à mochila (com empilhamento)
func add_to_backpack(item: ItemData) -> bool:
	# Itens empilháveis (ex: poções)
	if item.max_stack > 1:
		for i in backpack.size():
			if backpack[i].item_name == item.item_name and backpack[i].quantity < item.max_stack:
				backpack[i].quantity += 1
				emit_signal("backpack_updated", i, backpack[i])
				return true
	
	# Itens não empilháveis (ex: armas)
	backpack.append(item)
	emit_signal("backpack_updated", backpack.size() - 1, item)
	return true

## --------------------------------------------
## 4. FUNÇÕES AUXILIARES (PRIVADAS)
## --------------------------------------------

# Verifica se um item é válido para um slot
func _is_valid_for_slot(slot: SlotType, item: ItemData) -> bool:
	return item.get_class() == _slot_requirements[slot]

# Retorna o item atualmente equipado em um slot
func _get_slot_item(slot: SlotType) -> ItemData:
	match slot:
		SlotType.HEAD: return head
		SlotType.CHEST: return chest
		SlotType.LEGS: return legs
		SlotType.PRIMARY: return primary_weapon
		SlotType.SECONDARY: return secondary_weapon
		#SlotType.RING: return ring
		#SlotType.AMULET: return amulet
		_: return null

# Define o item em um slot
func _set_slot_item(slot: SlotType, item: ItemData):
	match slot:
		SlotType.HEAD: head = item
		SlotType.CHEST: chest = item
		SlotType.LEGS: legs = item
		SlotType.PRIMARY: primary_weapon = item
		SlotType.SECONDARY: secondary_weapon = item
		#SlotType.RING: ring = item
		#SlotType.AMULET: amulet = item

# Retorna o nome legível de um slot (para debug/UI)
func _get_slot_name(slot: SlotType) -> String:
	return SlotType.keys()[slot]

## --------------------------------------------
## 5. UTILIDADES PARA UI/SALVAMENTO
## --------------------------------------------

# Retorna todos os itens equipados como dicionário
func get_equipped_items() -> Dictionary:
	return {
		SlotType.HEAD: head,
		SlotType.CHEST: chest,
		# ... outros slots
	}

# Valida a integridade do inventário (debug)
func validate_integrity():
	for slot in SlotType.values():
		var item = _get_slot_item(slot)
		if item and not _is_valid_for_slot(slot, item):
			printerr("Item corrompido no slot ", _get_slot_name(slot), ": ", item.get_class())
