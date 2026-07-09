extends Card

var gainPaperAction = preload("res://resources/deck/card/gain_paper.gd")

func get_actions() -> Array[Action]:
	return [gainPaperAction]
