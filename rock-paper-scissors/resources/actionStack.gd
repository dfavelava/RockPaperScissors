class_name ActionStack
extends Resource

var actions: Array[Constants.Actions] = []

signal actions_updated
signal perform_action(action: Constants.Actions)

func addActions(newActions: Array[Constants.Actions]) -> void:
	for action in newActions:
		actions.push_back(action)
	actions_updated.emit()

func addAction(action: Constants.Actions) -> void:
	actions.push_back(action)
	actions_updated.emit()

func performAction() -> void:
	var performed_action: Constants.Actions = actions.pop_back()
	perform_action.emit(performed_action)
	actions_updated.emit()

func isEmpty() -> bool:
	return actions.is_empty()
