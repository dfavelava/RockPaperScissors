@abstract class_name Card
extends Resource

var actionStack = preload("res://resources/ActionStack.tres")

@abstract func get_actions() -> Array[Action]

func play_card() -> void:
	actionStack.addActions(get_actions())
