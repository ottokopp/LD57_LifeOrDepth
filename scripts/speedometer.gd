extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$RichTextLabel.text = "Speed:\n%d" % GameVariables.sub_speed
