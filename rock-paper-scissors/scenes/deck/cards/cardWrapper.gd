@abstract
class_name CardWrapper
extends Area2D

var defaultBackground: Texture2D = preload("res://assets/testCardBackground.tres")
var actionStack: ActionStack = preload("res://resources/ActionStack.tres")
var idManager: IdManager = preload("res://resources/idManager.tres")

var hovered := false
var cardId := -1

signal played_card(cardId: int)

@export var card: Card
@export var backgroundTexture := defaultBackground
@export var artTexture: Texture2D

@onready var backgroundSprite = $Background
@onready var artSprite = $Art
@onready var label = $Label

func _ready() -> void:
	backgroundSprite.texture = backgroundTexture
	artSprite.texture = artTexture
	label.text = get_name()
	
	mouse_entered.connect(onMouseEnter)
	mouse_exited.connect(onMouseExit)
	
	cardId = idManager.getId()

func _input(event: InputEvent) -> void:
	if hovered and event is InputEventMouseButton:
		# Left Mouse Button Click
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			onPlay()

func onPlay() -> void:
	card.play_card()
	played_card.emit(cardId)

func onMouseEnter() -> void:
	hovered = true

func onMouseExit() -> void:
	hovered = false
