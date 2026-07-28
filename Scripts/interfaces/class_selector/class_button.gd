extends ColorRect


#signal focused(class_data: ClassData)
signal selected(class_data: ClassData)
var my_data: ClassData

@onready var button: TextureButton = $MarginContainer/button

func setup(class_data: ClassData):
	my_data = class_data
	
	button.texture_normal = class_data.retrato_off
	button.texture_hover = class_data.retrato
	button.texture_pressed = class_data.retrato
	button.texture_focused = class_data.retrato
	# Conectamos os sinais internos do botão
	button.focus_entered.connect(_on_focus)
	button.pressed.connect(_on_click)

func _on_focus():
	# Quando o mouse entra, avisamos o mundo (Pai) quem somos
	# Emitimos o sinal passando 'my_data' como argumento
	selected.emit(my_data)

func _on_click():
	selected.emit(my_data)
