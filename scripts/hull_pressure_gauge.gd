extends Control

@onready var gauge_max = GameVariables.max_hull_dmg
@onready var gauge_num_pips = GameVariables.current_hull_dmg
@onready var hull_pip_scene = preload("res://scenes/fuel_pip.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_gauge()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_gauge()
	
func update_gauge():
	var hull_meter = %HullMeter
	gauge_max = GameVariables.max_hull_dmg
	gauge_num_pips = GameVariables.current_hull_dmg
	
	hull_meter.columns = gauge_max
	
	var children = hull_meter.get_children()
	for child in children:
		child.queue_free()
		
	for slot in range(gauge_num_pips):
		var new_pip = hull_pip_scene.instantiate()
		hull_meter.add_child(new_pip)
