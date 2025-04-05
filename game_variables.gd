extends Node

@onready var fuel_max: int = 3
@onready var current_fuel: int = 3
@onready var max_hull_dmg: int = 3
@onready var current_hull_dmg: int = 0
@onready var current_depth: int = 0

@onready var gadget_bag: Array[Gadget] = []
@onready var gadget_history: Array[Gadget] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
