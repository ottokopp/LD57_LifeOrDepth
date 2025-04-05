extends Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameVariables.cranked_the_thing.connect(update_bag_ui)
	GameVariables.toggle_ui_update.connect(update_bag_ui)
	update_bag_ui() # Hacky nonsense because here we don't actually need to know the gadget
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update_bag_ui():
	for child in %GridContainer.get_children():
		child.queue_free()
		
	for gadget in GameVariables.gadget_bag:
		var new_gadget_ui = GadgetUI.new()
		new_gadget_ui.gadget_data = gadget
		%GridContainer.add_child(new_gadget_ui)
