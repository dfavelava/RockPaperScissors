@abstract
class_name CardWrapper
extends Area2D

var defaultBackground: Texture2D = preload("res://assets/testCardBackground.tres")
var actionStack: ActionStack = preload("res://resources/ActionStack.tres")

var hovered := false

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

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		# Left Mouse Button Click
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			onPlay()

func onPlay() -> void:
	actionStack.addActions(card.get_actions())

func onMouseEnter() -> void:
	hovered = true

func onMouseExit() -> void:
	hovered = false
