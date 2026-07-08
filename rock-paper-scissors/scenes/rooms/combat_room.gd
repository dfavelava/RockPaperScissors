extends Node2D

enum TurnPhase {
	INITIALIZE,
	DRAW_PHASE,
	MAIN_PHASE,
	END_PHASE,
	ENEMY_MAIN_PHASE,
	ENEMY_END_PHASE,
	END_COMBAT
}

const NEXT_PHASE_MAP = {
	TurnPhase.INITIALIZE: TurnPhase.DRAW_PHASE,
	TurnPhase.DRAW_PHASE: TurnPhase.MAIN_PHASE,
	TurnPhase.MAIN_PHASE: TurnPhase.END_PHASE,
	TurnPhase.END_PHASE: TurnPhase.ENEMY_MAIN_PHASE,
	TurnPhase.ENEMY_MAIN_PHASE: TurnPhase.ENEMY_END_PHASE,
	TurnPhase.ENEMY_END_PHASE: TurnPhase.DRAW_PHASE
}

var turnCount := 0
var currentPhase := TurnPhase.INITIALIZE

var actionStack = preload("res://resources/ActionStack.tres")

signal entering_turn_phase(phase: TurnPhase)
signal exiting_turn_phase(phase: TurnPhase)

func _ready() -> void:
	actionStack.perform_action.connect(_on_perform_action)
	advancePhase()

func advancePhase() -> void:
	print("Exiting ", TurnPhase.find_key(currentPhase))
	exiting_turn_phase.emit(currentPhase)
	currentPhase = NEXT_PHASE_MAP.get(currentPhase)
	print("Entering ", TurnPhase.find_key(currentPhase))
	entering_turn_phase.emit(currentPhase)
	
	if currentPhase == TurnPhase.DRAW_PHASE:
		turnCount += 1

func _on_perform_action(action: Action) -> void:
	if action.actionName == Constants.Actions.END_TURN && currentPhase == TurnPhase.MAIN_PHASE:
		advancePhase()
