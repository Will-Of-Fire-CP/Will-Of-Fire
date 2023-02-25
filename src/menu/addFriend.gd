extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(PackedScene) var friend_data_node 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HTTPGetFriends_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var rsdata = json.result
	for data in rsdata:
		var friend_card = friend_data_node.instance()
		friend_card.add_friend_data(data.user_name,data.user_score,data.friend_id)
		print(data)
		add_child(friend_card)
	# print(rsdata)
	pass # Replace with function body.
