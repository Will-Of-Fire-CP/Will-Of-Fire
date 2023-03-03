extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var fireDamage = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	print(body.is_in_group("Enemytwo"))
	if body.is_in_group("Enemytwo"):
		print("here is my Enemy")
		body.taking_damage(fireDamage)
		#print("yes")
	pass # Replace with function body.

func show_fire_ball():
	$Area/CollisionShape.disabled = false
	$Timer.start()
	visible = true
	
	

func _on_Timer_timeout():
	$Timer.stop()
	visible = false
	$Area/CollisionShape.disabled = true
	#print("was Fired")
	pass # Replace with function body.
