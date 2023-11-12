extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Katze"):
		var scene = get_tree().get_nodes_in_group("Level")[0]
		scene.change_scene(scene.last_scene)
#last_scene has to be specified in current level
