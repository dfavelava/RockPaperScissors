class_name Action
extends Resource

@export var actionName: Constants.Actions
@export var types: Array[Constants.Types] = []
var targetId: int

func getTypes() -> Array[Constants.Types]:
	return types

func setTypes(newTypes: Array[Constants.Types]) -> void:
	types = newTypes

func addType(type: Constants.Types) -> void:
	if !(type in getTypes()):
		types.push_back(type)

func setTarget(id: int) -> void:
	targetId = id
