extends Node2D

@export var card_scene: PackedScene

var card_data_list = []
var rng = RandomNumberGenerator.new()

var packSize = 5
# Called when the node enters the scene tree for the first time.
func _ready():

	load_cards()
	#Testing
	rng.randomize()

func load_cards():
	var file = FileAccess.open("res://data/cards.json",FileAccess.READ)
	if file:
		var	text = file.get_as_text()
		var parsed = JSON.parse_string(text)
		if typeof(parsed) == TYPE_ARRAY:
			card_data_list = parsed
			print("✅ Karten geladen: ", card_data_list.size())
		else:
			push_error("❌ JSON ist nicht im erwarteten Array-Format!")
	else:
		push_error("❌ Konnte cards.json nicht öffnen")

func open_Pack_pressed():
	print("New Pack")
	#Alte Karten entfernen
	for child in get_children():
		if child is Node2D:
			if child != $Camera2D: # Kamera nicht löschen.
				child.queue_free()

	# Karten zufällig anzeigen
	var pack = []
	for i in range(packSize):
		var random_index = rng.randi_range(0, card_data_list.size() - 1)
		pack.append(card_data_list[random_index])
		

	#Karten nebeneinander Darstellen

	var spacing = 260 # abstand zwischen den Karten
	for i in range(pack.size()):
		var card = card_scene.instantiate()
		add_child(card)
		#Position berechnen
		
		
		var x = (i - (pack.size() - 1 / 2.0)) * spacing
		card.position = Vector2(x, 0)
		#Daten setzten
		print(x)
		card.set_card(pack[i])
