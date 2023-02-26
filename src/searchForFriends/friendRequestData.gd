extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var wasClicked = false

var request_id = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal new_friend_added

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if wasClicked:
		wasClicked = false
		$Panel.margin_bottom = 40
		$Button.margin_bottom = 40
		margin_bottom = 48
		$Accept.visible = false
		$Decline.visible = false
	else:
		wasClicked = true
		$Panel.margin_bottom = 70
		$Button.margin_bottom = 70
		margin_bottom = 70
		$Accept.visible = true
		$Decline.visible = true
	pass # Replace with function body.

func fill_data(requestName, score, request_id_DB):
	$RequestName.text = requestName
	$RequestScore.text = str(score)
	request_id = request_id_DB


func _on_Accept_pressed():
	$Accept.disabled = true
	$Decline.disabled = true
	var NewAccountData = {"friend_request_id" : request_id}
	var query = JSON.print(NewAccountData)
	var headers = ["Content-Type: application/json"]
	var urlLink = "https://willoffirebackend-production.up.railway.app/friend_requests/accept_friend_request"
	$HTTPAccept.request(urlLink, headers,true,HTTPClient.METHOD_POST,query)
	pass # Replace with function body.


func _on_Decline_pressed():
	$Accept.disabled = true
	$Decline.disabled = true
	var NewAccountData = {"friend_request_id" : request_id}
	var query = JSON.print(NewAccountData)
	var headers = ["Content-Type: application/json"]
	var urlLink = "https://willoffirebackend-production.up.railway.app/friend_requests/decline"
	$HTTPDecline.request(urlLink, headers,true,HTTPClient.METHOD_DELETE,query)
	pass # Replace with function body.


func _on_HTTPAccept_request_completed():
	emit_signal("new_friend_added")
	queue_free()
	pass # Replace with function body.


func _on_HTTPDecline_request_completed():
	print("rm Player",request_id)
	queue_free()
	pass # Replace with function body.
