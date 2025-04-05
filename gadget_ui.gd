extends Control
class_name GadgetUI
@export var gadget_data: Gadget

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_sprite: Sprite2D = Sprite2D.new()
	new_sprite.texture = gadget_data.texture
	new_sprite.scale = Vector2(0.215, 0.215)
	new_sprite.position = Vector2(20.0, 20.0)
	add_child(new_sprite)
	tooltip_text = gadget_data.description


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
