extends Button
class_name ShopButton

signal _bought_item(gadget: Gadget)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(_on_button_pressed)
	
func _on_button_pressed():
	var parent_gadget = get_parent()
	if parent_gadget.gadget_data.price <= GameVariables.money:
		GameVariables.gadget_bag.append(parent_gadget.gadget_data)
		_bought_item.emit(parent_gadget.gadget_data)
		GameVariables.money -= parent_gadget.gadget_data.price
		GameVariables.toggle_ui_update.emit()
	else:
		print("Can't afford this!")
	
	
