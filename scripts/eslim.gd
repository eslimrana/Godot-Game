extends CharacterBody3D

@onready var player=get_node("../Eslim")
@onready var cam_cur=1


func _ready():
	pass
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x=-5
		$MeshInstance3D.rotate_z(deg_to_rad(6))
	elif Input.is_action_pressed("ui_right"):
		velocity.x=5
		$MeshInstance3D.rotate_z(deg_to_rad(-6))
	else:
		velocity.x=lerp(velocity.x, 0.0, 0.2)
	if Input.is_action_pressed("ui_up"):
		velocity.z=-5
		$MeshInstance3D.rotate_x(deg_to_rad(-6))
	elif Input.is_action_pressed("ui_down"):
		velocity.z=5
		$MeshInstance3D.rotate_x(deg_to_rad(6))
	else:
		velocity.z=lerp(velocity.z, 0.0, 0.2)
	if Input.is_action_pressed("ui_accept"):
		get_parent().get_node("cam2").set_current(true)
	elif Input.is_action_pressed("ui_focus_prev"):
		$cam1.set_current(true)
	move_and_slide()


func _on_enemy_2_body_entered(body):
	if body.name == "Eslim":
		var packed_scene = PackedScene.new()
		packed_scene.pack(get_tree().get_current_scene())
		ResourceSaver.save(packed_scene,"res://my_scene.tscn")
		get_tree().change_scene_to_file("res://Q1.tscn")
	

func _on_area_3d_body_entered(body):
	if body.name == "Eslim":
		get_tree().change_scene_to_file("res://won.tscn") # Replace with function body.
