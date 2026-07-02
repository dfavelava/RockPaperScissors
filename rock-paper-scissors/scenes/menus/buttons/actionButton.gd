class_name ActionButton
extends Button

@export var actionName := ""

func _ready() -> void:
	connect("button_down", _on_button_down)

func _on_button_down() -> void:
	print(actionName)
