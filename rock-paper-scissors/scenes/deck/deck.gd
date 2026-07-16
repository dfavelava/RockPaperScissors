extends Node2D

var actionStack: ActionStack = preload("res://resources/ActionStack.tres")

var allCards: Array[CardWrapper] = []
var drawPile: Array[CardWrapper] = []
var discardPile: Array[CardWrapper] = []
var exiledCards: Array[CardWrapper] = []

var hand: Array[CardWrapper] = []

func _ready() -> void:
	for child in get_children():
		if child is CardWrapper:
			allCards.push_back(child)
			child.played_card.connect(onCardPlayed)
	
	drawPile = allCards.duplicate(true)
	drawPile.shuffle()

func onCardPlayed(cardId: int) -> void:
	print(cardId)
