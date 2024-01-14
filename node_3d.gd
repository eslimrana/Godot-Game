extends Node3D


var camera_speed = 80 
var camera

func _ready():
	camera = get_node("cam2")  

func _process(delta):
	var movement = Vector3.ZERO

	if Input.is_action_pressed("cam_control_right"):
		movement.x += 1
	if Input.is_action_pressed("cam_control_left"):
		movement.x -= 1
	if Input.is_action_pressed("cam_control_rise"):
		movement.y += 1
	if Input.is_action_pressed("cam_control_fall"):
		movement.y -= 1
	if Input.is_action_pressed("cam_control_up"):
		movement.z += 1
	if Input.is_action_pressed("cam_control_down"):
		movement.z -= 1
		
	movement = movement.normalized() * camera_speed

	camera.position += movement * delta
