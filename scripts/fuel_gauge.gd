extends Control

@onready var gauge_max = GameVariables.fuel_max
@onready var gauge_num_pips = GameVariables.current_fuel
@onready var fuel_pip_scene = preload("res://scenes/fuel_pip.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#update_fuel_gauge()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$VBoxContainer/MarginContainer/FuelText.text = \
	"Fuel: %d/%d" % [GameVariables.current_fuel, GameVariables.fuel_max
]	#update_fuel_gauge()

# deprecated	
#func update_fuel_gauge():
	#var fuel_meter = %FuelMeter
	#gauge_max = GameVariables.fuel_max
	#gauge_num_pips = GameVariables.current_fuel
	#
	#fuel_meter.columns = gauge_max
	#
	#var children = fuel_meter.get_children()
	#for child in children:
		#child.queue_free()
		#
	#for slot in range(gauge_num_pips):
		#var new_pip = fuel_pip_scene.instantiate()
		#fuel_meter.add_child(new_pip)
