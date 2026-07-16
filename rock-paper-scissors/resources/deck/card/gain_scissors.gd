class_name GainScissorsCard
extends Card

var gainScissorsAction = preload("res://resources/actions/gain/GainScissorsAction.tres")

func get_actions() -> Array[Action]:
	return [gainScissorsAction]
