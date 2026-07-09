extends Card

var gainRockAction = preload("res://resources/actions/gain/GainRockAction.tres")

func get_actions() -> Array[Action]:
	return [gainRockAction]
