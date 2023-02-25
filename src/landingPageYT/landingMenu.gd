extends VBoxContainer

onready var playerSavedData = SaveGameData.game_data
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if playerSavedData.player_log_in == true:
		$Credentials.visible = false
		$MainMenu.visible = true
		$MainMenu/Control/UserFriends.testingfun()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Credentials_playerIslogedIn():
	$MainMenu.visible = true
	$Credentials.visible = false
	$MainMenu/Control/UserFriends.testingfun()
	pass # Replace with function body.


func _on_MainMenu_playerLogingOut():
	SaveGameData.remove_user_data()
	print(playerSavedData)
	$MainMenu.visible = false
	$Credentials.visible = true
	
	pass # Replace with function body.
