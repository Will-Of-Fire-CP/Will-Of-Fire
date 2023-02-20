extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CreateAccount_pressed():
	if $Name.text.find(" ") > 0 || $Email.text.find(" ") > 0 || $SetPassword.text.find(" ") > 0 || $CoPassword.text.find(" ") > 0:
		print("can't contain space")
	elif $Name.text.length() < 3 || $Email.text.length() < 3 || $SetPassword.text.length() < 3 || $CoPassword.text.length() < 3:
		print("Too Short")
	elif $Name.text.length() < 3 || $Email.text.length() < 3 || $SetPassword.text.length() < 3 || $CoPassword.text.length() < 3:
		print("Too Short")
	elif $SetPassword.text != $CoPassword.text:
		print("password does not match")
	else:
		var NewAccountData = {
			"user_name": $Name.text,
			"password": $SetPassword.text,
			"useremail": $Email.text
		}
		var query = JSON.print(NewAccountData)
		var headers = ["Content-Type: application/json"]
		$HTTPRequest.request("https://willoffirebackend-production.up.railway.app/accounts/create_account",headers,true,HTTPClient.METHOD_POST,query)
	pass # Replace with function body.

# fix when backend is fixed 
func _on_HTTPRequest_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var rsdata = json.result
	# user_email
	#print(rsdata)
	if rsdata.message == "login confirmed":
		print("lets go")
	else:
		print("invalid user name")
	pass # Replace with function body.
