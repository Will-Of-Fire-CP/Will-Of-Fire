extends Node

const  SAVE_GAME_DATA = "res://SaveGameData.save"
var game_data = {}

func _ready():
	load_data()
	pass # Replace with function body.

func save_data():
	var file = File.new()
	file.open(SAVE_GAME_DATA, File.WRITE)
	file.store_var(game_data)
	file.close()
	
	
func load_data():
	var file = File.new()
	print(file.file_exists(SAVE_GAME_DATA))
	if not file.file_exists(SAVE_GAME_DATA):
		game_data = {
			"player_log_in": false
		}
		save_data()
		file.close()
	else:
		file.open(SAVE_GAME_DATA, File.READ)
		print(file.get_var())
		file.close()
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
