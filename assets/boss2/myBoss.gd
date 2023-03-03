extends KinematicBody

var health = 100
var count = 0

var navAgent : NavigationAgent

# Called when the node enters the scene tree for the first time.
func _ready():
	var animation = $AnimationPlayer.get_animation("hover")
	animation.set_loop(true)
	$AnimationPlayer.play("hover")
	
	
	navAgent = $NavigationAgent
	navAgent.connect("velocity_computed",self,"_on_velocity_computed")
	pass # Replace with function body.

func _physics_process(_delta):
	if navAgent.is_navigation_finished():
		return
	var targerPoss = navAgent.get_next_location()
	var direction = global_transform.origin.direction_to(targerPoss)
	var velocity = direction * navAgent.max_speed
	
	move_and_slide(velocity, Vector3.UP)

func _on_velocity_computed():
	pass

func taking_damage(amount):
	print("yess")
	health -= amount
	$Sprite3D/Viewport/green.rect_size.x = health
	if health <= 0:
		$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	count += 1
	scale.x += 1
	scale.y += 1
	scale.z += 1
	if count == 4:
		$Timer.stop()
	pass # Replace with function body.


func _on_YTTimer_timeout():
	navAgent.set_target_location(get_tree().get_nodes_in_group("Player")[0].global_transform.origin)
	pass # Replace with function body.
