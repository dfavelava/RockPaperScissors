class_name Enemy
extends Node2D

var actionStack = preload("res://resources/ActionStack.tres")

@export var health := 5
@export var max_health := 5

@export var type := Constants.Types.ROCK

signal health_updated

func _ready() -> void:
	actionStack.perform_action.connect(_on_perform_action)
	health_updated.connect(_on_health_updated)

func onPerformAction(_action: Action) -> void:
	pass

func onHealthUpdated() -> void:
	pass

func takeDamage(amount: int) -> void:
	health -= amount
	health_updated.emit()

func heal(amount: int) -> void:
	health += amount
	health_updated.emit()

func _on_perform_action(action: Action) -> void:
	onPerformAction(action)

func _on_health_updated() -> void:
	onHealthUpdated()
