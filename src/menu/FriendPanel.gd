extends Node2D

onready var playerSvedData = SaveGameData.game_data
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func testingfun():
	$HTTPGetFriends.request("https://willoffirebackend-production.up.railway.app/friend/%s"% [playerSvedData.player_data.user_id])
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


