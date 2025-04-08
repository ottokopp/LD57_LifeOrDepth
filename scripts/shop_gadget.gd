extends Control
class_name ShopGadget

@export var gadget: Gadget
@export var price: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_children())
	var vbox = get_node("VBoxContainer")
	for child in vbox.get_children():
		child.queue_free()
	var new_gadget_ui = GadgetUI.new()
	new_gadget_ui.gadget_data = gadget
	vbox.add_child(new_gadget_ui)
	vbox.get_node("PriceText").text = "%d $" % price
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
