extends RigidBody

const damage = 50
const speed = 10
var shoot = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func _on_Area_body_entered(_body):
	print("fire")
	pass # Replace with function body.
