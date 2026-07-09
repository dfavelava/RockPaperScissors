extends Card

var gainScissorsAction = preload("res://resources/deck/card/gain_scissors.gd")

func get_actions() -> Array[Action]:
	return [gainScissorsAction]
