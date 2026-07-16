extends Node2D

var handSize = 3

var actionStack: ActionStack = preload("res://resources/ActionStack.tres")
var idManager: IdManager = preload("res://resources/idManager.tres")

var allCards: Array[CardWrapper] = []
var piles := {
	Constants.CardLocations.DRAW_PILE: [],
	Constants.CardLocations.HAND: [],
	Constants.CardLocations.DISCARD_PILE: [],
	Constants.CardLocations.EXILED: []
}

@onready var combatRoom: CombatRoom = get_parent()

func _ready() -> void:
	combatRoom.entering_turn_phase.connect(onEnterTurnPhase)
	
	for child in get_children():
		if child is CardWrapper:
			allCards.push_back(child)
			child.played_card.connect(onCardPlayed)
			child.card_moved.connect(onCardMoved)
	
	piles[Constants.CardLocations.DRAW_PILE] = allCards.duplicate(true)
	piles[Constants.CardLocations.DRAW_PILE].shuffle()

func onEnterTurnPhase(phase: CombatRoom.TurnPhase) -> void:
	if phase == CombatRoom.TurnPhase.DRAW_PHASE:
		for card in piles[Constants.CardLocations.HAND]:
			card.moveCard(Constants.CardLocations.DISCARD_PILE)
		
		for i in range(handSize):
			var drawPile = piles[Constants.CardLocations.DRAW_PILE]
			if drawPile.size() > 0:
				drawPile[0].moveCard(Constants.CardLocations.HAND)
		combatRoom.advancePhase()

func onCardPlayed(cardId: int) -> void:
	var cardWrapper: CardWrapper = idManager.getObjectById(cardId)
	cardWrapper.moveCard(Constants.CardLocations.DISCARD_PILE)

func onCardMoved(cardId: int, oldLoc: Constants.CardLocations, newLoc: Constants.CardLocations) -> void:
	var updatedPile: Array[CardWrapper] = []
	for card: CardWrapper in piles[oldLoc]:
		if card.cardId != cardId:
			updatedPile.push_back(card)
	piles[oldLoc] = updatedPile
	
	var newPile = piles[newLoc] as Array[CardWrapper]
	newPile.push_back(idManager.getObjectById(cardId))
