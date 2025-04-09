extends Resource
class_name ItemData

@export var item_name: String = "Item" #Pensando em mudar para item_type para ter items/consumiveis
@export var icon: Texture2D
@export var max_stack: int = 1  # 1 para itens não empilháveis (armas/armaduras)
@export var price: int = 0
