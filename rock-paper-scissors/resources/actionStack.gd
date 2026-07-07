class_name ActionStack
extends Resource

var actions: Array[Action] = []

signal actions_updated
signal perform_action(action: Action)

func addActions(newActions: Array[Action]) -> void:
	for action in newActions:
		actions.push_back(action)
	actions_updated.emit()

func addAction(action: Action) -> void:
	actions.push_back(action)
	actions_updated.emit()

func performAction() -> void:
	var performed_action: Action = actions.pop_back()
	perform_action.emit(performed_action)
	actions_updated.emit()

func isEmpty() -> bool:
	return actions.is_empty()
