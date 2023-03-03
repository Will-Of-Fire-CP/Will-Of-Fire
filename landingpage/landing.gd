extends Node2D

signal playerIslogedIn
onready var playerSavedData = SaveGameData.game_data
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#onready var save_file = SaveGameData.game_data

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SignUpButton_pressed():
	$MarginContainer/SignUpLine.visible = false
	$MarginContainer/LoginLine.visible = true
	$MarginContainer/Login.visible = false
	$MarginContainer/SignUp.visible = true
	$SignUpButton.add_color_override("font_color", Color(225,225,225))
	$LoginButton.add_color_override("font_color", Color(0,0,0))
	pass # Replace with function body.

func _on_LoginButton_pressed():
	$MarginContainer/SignUpLine.visible = true
	$MarginContainer/LoginLine.visible = false
	$MarginContainer/Login.visible = true
	$MarginContainer/SignUp.visible = false
	$SignUpButton.add_color_override("font_color", Color(0,0,0))
	$LoginButton.add_color_override("font_color",  Color(225,225,225))
	pass # Replace with function body.




func _on_Login_playerIslogingIn(data):
	# accounts/login
	var query = JSON.print(data)
	var headers = ["Content-Type: application/json"]
	$MarginContainer/HTTPRequestLogin.request("https://willoffirebackend-production.up.railway.app/accounts/login",headers,true,HTTPClient.METHOD_POST,query)
	pass # Replace with function body.


func _on_HTTPRequestLogin_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var rsdata = json.result
	#print('here is requesr')
	# user_email
	if rsdata.message == "login confirmed":
		playerSavedData.player_data = rsdata
		playerSavedData.player_log_in = true
		SaveGameData.save_data(playerSavedData)
		if(playerSavedData.player_log_in):
			emit_signal("playerIslogedIn")
	else:
		print("no user")
	$MarginContainer/Login/LogInButton.disabled = false
	pass # Replace with function body.
