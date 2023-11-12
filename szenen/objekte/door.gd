extends StaticBody2D

func open():
	$AnimatedSprite.frame = 1
	$CollisionShape2D.disabled = true
