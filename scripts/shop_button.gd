extends Button
class_name ShopButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(_on_button_pressed)
	
func _on_button_pressed():
	var parent_gadget = get_parent()
	GameVariables.gadget_bag.append(parent_gadget.gadget_data)
	get_parent().queue_free()
	GameVariables.toggle_ui_update.emit()
	
	
