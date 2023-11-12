extends StaticBody2D

func _ready():
	$AnimatedSprite2D.frame = 1

func schalter_triggered():
	$AnimatedSprite2D.frame = 0
	get_tree().get_nodes_in_group("Door")[0].open()


func _on_timer_timeout():
	schalter_triggered()
