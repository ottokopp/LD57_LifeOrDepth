extends Control

@onready var shop_gadgets: Array[Gadget] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func get_gadget_price(gadget) -> int:
	# TODO: calculate price based on gadget affixes.
	return 100
	
func make_gadget_button(gadget) -> GadgetUI:
	var new_gadget_ui = GadgetUI.new()
	new_gadget_ui.gadget_data = gadget
	var price_tag = RichTextLabel.new()
	price_tag.position = Vector2(0, 45)
	price_tag.custom_minimum_size = Vector2(50, 25)
	price_tag.text = "%d $" % get_gadget_price(gadget)
	new_gadget_ui.add_child(price_tag)
	var buy_button = ShopButton.new()
	buy_button.custom_minimum_size = Vector2(40, 40)
	new_gadget_ui.add_child(buy_button)
	return new_gadget_ui

func restock_shop():
	shop_gadgets = []
	for n in range(6):
		var new_gadget = GameVariables.get_random_gadget()
		shop_gadgets.append(new_gadget)
	update_shop_ui()

func update_shop_ui():
	for child in $GadgetShopGrid.get_children():
		child.queue_free()
	for gadget in shop_gadgets:
		var new_gadget_button = make_gadget_button(gadget)
		$GadgetShopGrid.add_child(new_gadget_button)
	
