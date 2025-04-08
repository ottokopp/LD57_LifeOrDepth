extends Node

@onready var rng = RandomNumberGenerator.new() 

@onready var fuel_max: int = 3
@onready var current_fuel: int = 3
@onready var max_hull_dmg: int = 3
@onready var current_hull_dmg: int = 0
@onready var current_depth: int = 0
@onready var money: int = 0
@onready var lives: int = 3

@onready var gadget_bag: Array[Gadget] = []
@onready var gadget_history: Array[Gadget] = []

@onready var first_game_setup = true

signal cranked_the_thing()
signal toggle_ui_update()

var gadget_data: Array = [
	"res://data/gadget_black.tres",
	"res://data/gadget_blue.tres",
	"res://data/gadget_green.tres",
	"res://data/gadget_orange.tres",
	"res://data/gadget_purple.tres",
	"res://data/gadget_red.tres",
	"res://data/gadget_white.tres",
	"res://data/gadget_yellow.tres",
]

var starter_items_dict: Array[Array] = [
	[4, "res://data/gadget_red.tres"],
	[2, "res://data/gadget_yellow.tres"],
	[3, "res://data/gadget_black.tres"],
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup_starter_bag()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if StateMachine.in_state == 0:
		# Lose condition:
		if current_hull_dmg >= max_hull_dmg:
			print("Hull damages!! Eject!!")
			initiate_eject(true)
		elif current_fuel == 0:
			print("Fuel empty! Eject!")
			initiate_eject(false)
		elif len(gadget_bag) <= 0:
			print("Out of gadgets! Eject!")
			initiate_eject(false)
			
func return_from_history_to_bag():
	print("Returning gadgets to bag.")
	while gadget_history:
		var temp_gadget = gadget_history.pop_front()
		gadget_bag.append(temp_gadget)
		
func get_random_gadget():
	var random_gadget_data_path = gadget_data.pick_random()
	var random_gadget_data = load(random_gadget_data_path)
	var new_gadget = get_gadget_from_data(random_gadget_data)
	return new_gadget
		
func get_gadget_from_data(gadget_info) -> Gadget:
	var new_gadget = Gadget.new()
	print(gadget_info)
	new_gadget.name = gadget_info.name
	new_gadget.description = gadget_info.description
	new_gadget.texture = gadget_info.texture
	new_gadget.type = gadget_info.type
	return new_gadget
	
func setup_starter_bag():
	if first_game_setup:
		for start_info in starter_items_dict:
			var gadget_num = start_info[0]
			var gadget_data_path = start_info[1]
			var gadget_info: Resource = load(gadget_data_path)
			for n in range(gadget_num):
				var new_gadget = get_gadget_from_data(gadget_info)
				gadget_bag.append(new_gadget)
		first_game_setup = false
	gadget_bag.shuffle()
	#print("Initiated Bag with the following items:")
	#for gadget in gadget_bag:
		#print(gadget.name, gadget.type, gadget.texture.resource_path)
		
func crank():
	# Debug stuff:
	current_fuel -= 1
	# current_hull_dmg += 1
	money += 200
	current_depth += 100
	print("Cranked it! Fuel now at ", current_fuel, "\n", "Hull damage at ", current_hull_dmg)
	# End debug stuff
	
	gadget_bag.shuffle()
	var picked_gadget = gadget_bag.front()
	gadget_bag.pop_front()
	gadget_history.append(picked_gadget)
	cranked_the_thing.emit()
	
func initiate_eject(forced):
	if forced:
		lives -= 1
		if lives <= 0:
			StateMachine.enter_game_over()
	else:
		print("Entering Shop.")
		StateMachine.enter_shop()
		
func initiate_reset():
	current_fuel = fuel_max
	current_hull_dmg = 0
	current_depth = 0
	return_from_history_to_bag()
	setup_starter_bag()
	toggle_ui_update.emit()
