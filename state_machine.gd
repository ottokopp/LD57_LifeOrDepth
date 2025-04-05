extends Node

enum State {Sub, Shop, Menu, GameOver}

@onready var in_state: State = 0
signal entered_game_over
signal entered_sub
signal entered_shop

func enter_sub():
	in_state = 0
	GameVariables.initiate_reset()
	entered_sub.emit()

func enter_game_over():
	in_state = 3
	entered_game_over.emit()

func enter_shop():
	in_state = 1
	entered_shop.emit()
