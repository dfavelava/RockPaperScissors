class_name GainPaperCard
extends Card

var gainPaperAction: Action = preload("res://resources/actions/gain/GainPaperAction.tres")

func get_actions() -> Array[Action]:
	print("Gain Paper")
	return [gainPaperAction]
