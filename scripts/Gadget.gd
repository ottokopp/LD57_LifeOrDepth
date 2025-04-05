extends Resource
class_name Gadget

enum Type {Red, Green, Yellow, Blue, Purple, Black, White, Orange}

@export var type: Type
@export var name: String
@export_multiline var description: String
@export var texture: Texture2D
