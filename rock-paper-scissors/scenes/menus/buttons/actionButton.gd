class_name ActionButton
extends Button

@export var actionName: Constants.Actions

var action_stack = preload("res://resources/ActionStack.tres")

func _ready() -> void:
	connect("button_down", _on_button_down)

func _on_button_down() -> void:
	action_stack.addActions([Constants.Actions.END_TURN, actionName])
