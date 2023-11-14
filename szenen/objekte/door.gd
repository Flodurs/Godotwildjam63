extends StaticBody2D

var canBeOpened:bool = false

func open():
	$AnimatedSprite.frame = 1
	$CollisionShape2D.disabled = true
	
func close():
	$AnimatedSprite.frame = 0
	$CollisionShape2D.disabled = false


#func _on_openeable_timeout():
#	canBeOpened = true
