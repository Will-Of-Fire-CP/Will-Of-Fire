extends Node2D

signal playerIslogingIn
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var loginData = {
	"user_name" : null,
	"password" : null
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LogInButton_pressed():
	#print($Password.text)
	loginData.user_name = $UserName.text
	loginData.password = $Password.text
	emit_signal("playerIslogingIn",loginData)
	pass # Replace with function body.
