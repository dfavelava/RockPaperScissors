class_name ActionStackLabel
extends Label

@export var actionDelaySec = 0.5

var action_stack = preload("res://resources/ActionStack.tres")

var performDelayTimer := Timer.new()

func _ready() -> void:
	self.text = action_stack.actions.reduce(concatString, "")
	action_stack.actions_updated.connect(_on_actions_updated)
	
	performDelayTimer.wait_time = actionDelaySec
	performDelayTimer.one_shot = true
	performDelayTimer.autostart = false
	add_child(performDelayTimer)
	performDelayTimer.timeout.connect(_on_perform_delay_timer_timeout)

func _on_actions_updated() -> void:
	self.text = action_stack.actions.reduce(concatString, "")
	performDelayTimer.start()

func _on_perform_delay_timer_timeout() -> void:
	if !action_stack.isEmpty():
		action_stack.performAction()

func concatString(accum, actionName) -> String:
	return accum + actionName + "\n"
