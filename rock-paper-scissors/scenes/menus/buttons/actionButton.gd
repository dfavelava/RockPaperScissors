class_name ActionButton
extends Button

@export var action: Action
var action_stack = preload("res://resources/ActionStack.tres")
var endTurnAction: EndTurnAction = preload("res://resources/actions/EndTurnAction.tres")

func _ready() -> void:
	connect("button_down", _on_button_down)

func _on_button_down() -> void:
	action_stack.addActions([endTurnAction, action])
