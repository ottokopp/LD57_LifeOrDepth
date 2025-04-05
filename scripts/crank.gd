extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _button_pressed():
	GameVariables.current_fuel -= 1
	GameVariables.current_hull_dmg += 1
	print("Cranked it! Fuel now at ", GameVariables.current_fuel, "\n", "Hull damage at ", GameVariables.current_hull_dmg)
