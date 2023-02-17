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


func _on_SignUpButton_pressed():
	print("got to Sign Up")
	$SignUpLine.visible = false
	$LoginLine.visible = true
	$Login.visible = false
	$SignUp.visible = true
	$SignUpButton.add_color_override("font_color", Color(225,225,225))
	$LoginButton.add_color_override("font_color", Color(0,0,0))
	pass # Replace with function body.


func _on_LoginButton_pressed():
	print("got to Login")
	$SignUpLine.visible = true
	$LoginLine.visible = false
	$Login.visible = true
	$SignUp.visible = false
	$LoginButton.add_color_override("font_color", Color(225,225,225))
	$SignUpButton.add_color_override("font_color", Color(0,0,0))
	pass # Replace with function body.
