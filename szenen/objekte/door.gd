extends Area2D

var next: PackedScene


func _on_body_entered(body):
	for i in body.get_groups():
		if i == "Player":
			get_tree().change_scene_to_packed(next)
