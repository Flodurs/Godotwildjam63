extends StaticBody2D

var isConnected:bool = false

func _ready():
	$AnimatedSprite2D.frame = 1

func _process(_delta):
#	print(isConnected)
	pass

func schalter_triggered():
	$AnimatedSprite2D.frame = 0
	get_tree().get_nodes_in_group("Door")[0].open()

func update():
	isConnected = false

func _on_timer_timeout():
	schalter_triggered()
