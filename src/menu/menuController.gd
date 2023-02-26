extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GetFriends_pressed():
	$YourFriendLine.visible = false
	$FriendRequestLine.visible = true
	$sendRequestLine.visible = true
	
	$UserFriends.visible = true
	$SearchFriend.visible = false
	$FriendRequestPanel.visible = false
	pass # Replace with function body.


func _on_GetFriendRequests_pressed():
	$YourFriendLine.visible = true
	$FriendRequestLine.visible = false
	$sendRequestLine.visible = true
	
	$UserFriends.visible = false
	$SearchFriend.visible = false
	$FriendRequestPanel.visible = true
	pass # Replace with function body.


func _on_SendFriendRequest_pressed():
	$YourFriendLine.visible = true
	$FriendRequestLine.visible = true
	$sendRequestLine.visible = false
	
	$UserFriends.visible = false
	$SearchFriend.visible = true
	$FriendRequestPanel.visible = false
	pass # Replace with function body.
