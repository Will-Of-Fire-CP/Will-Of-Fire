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

func player_log_out_remove_friends_request():
	for data in get_children() :
		data.queue_free()

func _on_HTTPRequest_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var rsdata = json.result
	for data in rsdata:
		var friend_card = friend_data_node.instance()
		friend_card.fill_data(data.user_name, data.user_score, data.friend_request_id)
		#connect_signal(friend_card)
		#print(data)
		add_child(friend_card)
	pass # Replace with function body.


	
