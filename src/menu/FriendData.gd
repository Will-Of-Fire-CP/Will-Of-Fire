extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var playerSavedData = SaveGameData.game_data

export var FriendId = "str"
var wasClicked = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_friend_data(user_name,user_score,friend_id):
	$Name.text = user_name
	$Score.text = str(user_score)
	FriendId = friend_id
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if wasClicked:
		wasClicked = false
		$Panel.margin_bottom = 40
		$Button.margin_bottom = 40
		margin_bottom = 48
		$Button2.visible = false
	else:
		wasClicked = true
		$Panel.margin_bottom = 70
		$Button.margin_bottom = 70
		margin_bottom = 70
		$Button2.visible = true
		
	
	pass # Replace with function body.


func _on_Button2_pressed():
	#/friend/remove_friend
	playerSavedData = SaveGameData.game_data
	var query = JSON.print({
		"user_id": playerSavedData.player_data.user_id,
		"friend_id" : FriendId
	})
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request("https://willoffirebackend-production.up.railway.app/friend/remove_friend",headers,true,HTTPClient.METHOD_POST,query)


func _on_HTTPRequest_request_completed(_result, _response_code, _headers, _body):
	queue_free()
