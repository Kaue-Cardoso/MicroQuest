extends GridContainer

# Arraste a cena ClassItem.tscn para cá no inspetor
@export var class_button: PackedScene 

# Pasta onde estão seus arquivos .tres
var classes_path = "res://Resources/Class/ClassData/"

func _ready():
	# Limpa os itens manuais que você deixou para teste
	for child in get_children():
		child.queue_free()
		
	load_classes()

func load_classes():
	var dir = DirAccess.open(classes_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		
		while file_name != "":
			if file_name.ends_with(".tres"):
				# 1. Carrega o recurso
				var res = load(classes_path + file_name)
				
				# 2. Instancia a cena do quadrado
				var instance = class_button.instantiate()
				
				# 3. Adiciona ao GridContainer
				add_child(instance)
				
				# 4. Passa os dados para a instância
				instance.setup(res)
				
				# --- AQUI ESTÁ A MÁGICA QUE FALTAVA ---
				
				# 'owner' pega a raiz da cena (Character_Select) onde este Grid está.
				if owner.has_method("update_info_labels"):
					instance.selected.connect(owner.update_info_labels)
					# CORREÇÃO: Verifique se o método existe antes de conectar
				if owner.has_method("_on_class_selected"):
					instance.selected.connect(owner._on_class_selected)
				
				
				# Importante para navegação por teclado:
			# Faz com que o primeiro botão ganhe foco automaticamente ao abrir a tela
				if get_child_count() == 1:
					instance.button.grab_focus() 
					owner.call_deferred("update_info_labels", res)
				
			file_name = dir.get_next()
