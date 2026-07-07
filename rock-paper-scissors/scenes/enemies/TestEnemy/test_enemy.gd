extends Enemy

@onready var healthLabel = $Label

func onPerformAction(action: Action) -> void:
	var actionName = action.actionName
	match actionName:
		Constants.Actions.ROCK:
			takeDamage(1)

func onHealthUpdated() -> void:
	healthLabel.text = str(health) + " / " + str(max_health)
