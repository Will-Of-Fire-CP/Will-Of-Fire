extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var FriendId = "str"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_friend_data(user_name,user_score,friend_id):
	$Name.text = user_name
	$Score.text = str(user_score)
	FriendId = friend_id
	print("hi")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
