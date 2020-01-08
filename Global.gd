extends Node

# If paddle_exit is true, paddle will descend upon touch
onready var paddle_exit = true

onready var score = 0

# Signifies if game is running
onready var game_started = false

# For storing the best score
var best_score = 0
const filepath = 'user://bestscore.data'

# Load the best score when the game starts
func _ready():
	load_best_score()

func load_best_score():
	var file = File.new()
	
	# If launching game for the very first time
	if not file.file_exists(filepath):
		return
		
	file.open(filepath, File.READ)
	best_score = file.get_var()
	file.close()

func save_best_score():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(best_score)
	file.close()
	
func set_best_score(new_value):
	best_score = new_value
	save_best_score()
	