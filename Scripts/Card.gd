extends Node2D

const CARD_IMAGE_PATH = "res://assets/cards/"

@export var card_name:String = "Bisasam"
@export var rarity:String = "Common"



@onready var name_label = $CardRoot/NameLabel
@onready var rarity_label = $CardRoot/RarityLabel
@onready var cardImage = $CardRoot/CardImage 
@onready var frame = $CardRoot/CardFrame
@onready var anim = $CardRoot/AnimationPlayer
@onready var backImage = $CardRoot/BackImage






# Called when the node enters the scene tree for the first time.
func _ready():
	name_label.text = card_name
	rarity_label.text = rarity

	

	apply_rarity_color()





func set_card(data: Dictionary):
	if data.has("name"):
		card_name = data["name"]
		name_label.text = card_name
	if data.has("rarity"):
		rarity = data["rarity"]
		rarity_label.text = rarity
		apply_frame_color(data["rarity"])
		apply_rarity_color()
	if data.has("image"):
		var path = data["image"]
		if not path.begins_with("res://"):
			path = CARD_IMAGE_PATH + path		
		cardImage.texture = load(path)


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

func apply_frame_color(raritydata):
	var stylebox = frame.get_theme_stylebox("panel").duplicate() as StyleBoxFlat
	match raritydata.to_lower():
		"common":
			stylebox.border_color = Color.GRAY
		"uncommon":
			stylebox.border_color = Color.GREEN
		"rare":
			stylebox.border_color = Color.BLUE
		"ultra":
			stylebox.border_color = Color.SILVER
		"legendary":
			stylebox.border_color = Color.GOLD
		"_":
			stylebox.border_color = Color.WHITE

	frame.add_theme_stylebox_override("panel",stylebox)


func flip():
	anim.play("flip")

func flip_with_delay(delay):
	await get_tree().create_timer(delay).timeout
	flip()