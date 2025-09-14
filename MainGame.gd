extends Node2D

@onready var card = $Card #Referenz für die Card

# Called when the node enters the scene tree for the first time.
func _ready():
	var bisasam_data = {
		"name": "Bisasam",
		"rarity" : "Rare",
		"image" : "res://assets/cards/001_Bisasam.png"

	}

	var bisaknops_data = {
		"name": "Bisaknosp",
		"rarity" : "Common",
		"image" : "res://assets/cards/002_Bisaknosp.png"

	}

	card.set_card(bisasam_data)