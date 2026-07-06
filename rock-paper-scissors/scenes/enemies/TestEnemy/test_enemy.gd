extends Enemy

@onready var healthLabel = $Label

func onPerformAction(actionName: Constants.Actions) -> void:
	match actionName:
		Constants.Actions.ROCK:
			print("here")
			takeDamage(1)

func onHealthUpdated() -> void:
	healthLabel.text = str(health) + " / " + str(max_health)
