extends Area2D

func _on_body_entered(_body):
	var scene = get_tree().get_nodes_in_group("Level")[0]
	scene.change_scene(scene.last_scene)
