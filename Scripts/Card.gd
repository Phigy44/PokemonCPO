extends Node2D

@export var card_name:String = "Bisasam"
@export var rarity:String = "Common"
@export var image_path:String = "res://assets/cards/002_Bisaknosp.png"


@onready var name_label = $NameLabel
@onready var rarity_label = $RarityLabel
@onready var front_sprite = $Front 
# Called when the node enters the scene tree for the first time.
func _ready():
	name_label.text = card_name
	rarity_label.text = rarity

	#Bild setzten
	if image_path != "":
		front_sprite.texture = load(image_path)
	apply_rarity_color()


func set_card(data: Dictionary):
	if data.has("name"):
		card_name = data["name"]
		name_label.text = card_name
	if data.has("rarity"):
		rarity = data["rarity"]
		rarity_label.text = rarity
		apply_rarity_color()
	if data.has("image"):
		image_path = data["image"]
		rarity_label.text = rarity
		front_sprite.texture = load(image_path)


func apply_rarity_color():
	match rarity.to_lower():
		"common":
			rarity_label.modulate = Color.GRAY
		"uncommon":
			rarity_label.modulate = Color.GREEN
		"rare":
			rarity_label.modulate = Color.BLUE
		"ultra":
			rarity_label.modulate = Color.SILVER
		"legendary":
			rarity_label.modulate = Color.GOLD
		"_":
			rarity_label.modulate = Color.WHITE
