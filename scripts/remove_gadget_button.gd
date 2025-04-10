extends Button
class_name RemoveGadgetButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(_on_button_pressed)
	self.visible = false
	
func _on_button_pressed():
	var parent_gadget = get_parent()
	GameVariables.gadget_bag.erase(parent_gadget.gadget_data)
	get_parent().queue_free()
	GameVariables.money -= 200
	GameVariables.toggle_ui_update.emit()
	
	
