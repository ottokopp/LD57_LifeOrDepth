extends Node2D

func _ready() -> void:
	StateMachine.entered_game_over.connect(_enter_game_over)
	StateMachine.entered_shop.connect(_enter_shop)
	StateMachine.entered_sub.connect(_enter_sub)
	
func _enter_game_over():
	print("GAME OVER!")
	
func _enter_shop():
	%SubmarineLayer.visible = false
	%ShopLayer.visible = true

func _enter_sub():
	%SubmarineLayer.visible = true
	%ShopLayer.visible = false
