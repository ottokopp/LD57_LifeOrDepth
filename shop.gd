extends Control

@onready var shop_gadgets: Array[Gadget] = []
@onready var are_gadgets_removable: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RemoveGadget._toggled_gadget_removal.connect(toggle_gadget_removal)
	GameVariables.toggle_ui_update.connect(update_shop_ui)
	
func get_gadget_price(gadget: Gadget) -> int:
	# TODO: calculate price based on gadget affixes.
	return gadget.price
	
func make_gadget_button(gadget, button_type = ShopButton) -> GadgetUI:
	var new_gadget_ui = GadgetUI.new()
	new_gadget_ui.gadget_data = gadget
	var buy_button = button_type.new()
	if button_type == ShopButton:
		var price_tag = RichTextLabel.new()
		price_tag.position = Vector2(0, 45)
		price_tag.custom_minimum_size = Vector2(50, 25)
		price_tag.text = "%d $" % get_gadget_price(gadget)
		new_gadget_ui.add_child(price_tag)
		
		buy_button._bought_item.connect(remove_from_shop)
		
	buy_button.custom_minimum_size = Vector2(40, 40)
	new_gadget_ui.add_child(buy_button)
	return new_gadget_ui

func remove_from_shop(gadget):
	print("triggered removal of ", gadget.name)
	shop_gadgets.erase(gadget)
	update_shop_ui()

func restock_shop():
	shop_gadgets = []
	for n in range(6):
		var new_gadget = GameVariables.get_random_gadget()
		shop_gadgets.append(new_gadget)
	update_shop_ui()

func update_shop_ui():
	are_gadgets_removable = false
	# Gadget Shop Grid
	for child in $GadgetShopGrid.get_children():
		child.queue_free()
	for gadget in shop_gadgets:
		var new_gadget_button = make_gadget_button(gadget, ShopButton)
		$GadgetShopGrid.add_child(new_gadget_button)
	
	# Gadget Reference/Removal Grid
	for child in $CurrentBagGrid.get_children():
		child.queue_free()
	for gadget in GameVariables.gadget_bag:
		var new_gadget_button = make_gadget_button(gadget, RemoveGadgetButton)
		$CurrentBagGrid.add_child(new_gadget_button)

func toggle_gadget_removal():
	for child in $CurrentBagGrid.get_children():
		for button in child.get_children():
			if button is RemoveGadgetButton:
				button.visible = not(are_gadgets_removable)
	are_gadgets_removable = not(are_gadgets_removable)
	
