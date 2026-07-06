extends Node2D

@onready var countLabel: Label = $Sprite2D/Label

var count := 0

func decrement(num = 1) -> void:
	count = max(0, count - num)

func increment(num = 1) -> void:
	count += num

func updateLabel() -> void:
	countLabel.text = str(count)
