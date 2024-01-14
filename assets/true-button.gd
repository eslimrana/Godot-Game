extends Button


func _on_pressed():
	var packed_scene = load("res://my_scene.tscn")
# Instance the scene
	#var my_scene = packed_scene.instance()
	get_tree().change_scene_to_packed(packed_scene)
