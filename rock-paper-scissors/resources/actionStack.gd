class_name ActionStack
extends Resource

const actions := []

func addAction(action: String) -> void:
	actions.push_front(action)

func performAction() -> void:
	actions.pop_front()
