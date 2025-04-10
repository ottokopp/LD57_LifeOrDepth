extends Button

signal _toggled_gadget_removal
@onready var removal_price = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(_on_button_pressed)
	self.text = "Remove\nGadget\n%d $" % removal_price

func _on_button_pressed():
	if GameVariables.money >= 200:
		_toggled_gadget_removal.emit()
	else:
		print("Can't afford this!")
