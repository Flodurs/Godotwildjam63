extends Node2D


func _on_body_entered(body):
	var scene = get_tree().get_nodes_in_group("Level")[0]
	scene.change_scene(scene.next_scene)
