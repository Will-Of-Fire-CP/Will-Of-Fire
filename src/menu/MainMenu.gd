extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal playerLogingOut
onready var playerSavedData = SaveGameData.game_data

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LogOut_pressed():
	emit_signal("playerLogingOut")
	pass # Replace with function body.
	
func set_player_data():
	$Control/PlayerName.text = playerSavedData.player_data.user_name
	$Control/ScoreText.text = playerSavedData.player_data.user_score
	#print(playerSavedData, "here")
	#$Control/PlayerName = 
