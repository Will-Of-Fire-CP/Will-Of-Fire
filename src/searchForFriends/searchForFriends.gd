extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var playerSavedData = SaveGameData.game_data

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if playerSavedData.player_data.user_name == $FriendName.text:
		print("User name")
	elif($FriendName.text.length() > 2):
		print($FriendName.text)
		var NewAccountData = {
			"user_id": playerSavedData.player_data.user_id,
			"search_friend_name": $FriendName.text
		}
		var query = JSON.print(NewAccountData)
		var headers = ["Content-Type: application/json"]
		var getFriendLink = "https://willoffirebackend-production.up.railway.app/accounts/user_search"
		$GetUserByName.request(getFriendLink, headers,true,HTTPClient.METHOD_POST,query)
	
		
	pass # Replace with function body.


func _on_GetUserByName_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var rsdata = json.result
	print(json.result)
	pass # Replace with function body.
