extends Node2D

onready var playerSvedData = SaveGameData.game_data
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal relode_friend_list

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func getplayer_friend_request():
	$HTTPRequest.request("https://willoffirebackend-production.up.railway.app/friend_requests/requests/%s"% [playerSvedData.player_data.user_id])
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_GetFriendRequests_pressed():
	$ScrollContainer/VBoxContainer.player_log_out_remove_friends_request()
	$HTTPRequest.request("https://willoffirebackend-production.up.railway.app/friend_requests/requests/%s"% [playerSvedData.player_data.user_id])
	pass # Replace with function body.
