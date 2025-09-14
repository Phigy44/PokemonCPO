extends Node2D

@export var card_scene: PackedScene

var card_data_list = []
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	#Testing
	card_data_list = [
		{"name": "Bisasam", "rarity": "common", "image": "res://assets/cards/001_Bisasam.png"},
		{"name": "Bisaknops", "rarity": "rare", "image": "res://assets/cards/002_Bisaknosp.png"},
		{"name": "Bisaflor", "rarity": "Legendary", "image": "res://assets/cards/003_Bisaflor.png"},
		{"name": "Glumanda", "rarity": "common", "image": "res://assets/cards/005_Glutexo.png"},
		{"name": "Glutexo", "rarity": "rare", "image": "res://assets/cards/005_Glutexo.png"},
		{"name": "Glurak", "rarity": "Legendary", "image": "res://assets/cards/005_Glutexo.png"},
	]
	rng.randomize()
	spawn_cards()

func open_Pack_pressed():
	print("New Pack")


func spawn_cards():
	var spacing = 260 # abstand zwischen den Karten
	for i in range(card_data_list.size()):
		var card = card_scene.instantiate()
		add_child(card)
		#Position berechnen
		
		
		var x = (i - (card_data_list.size() - 1 / 2.0)) * spacing
		card.position = Vector2(x, 0)
		#Daten setzten
		print(x)
		card.set_card(card_data_list[i])
