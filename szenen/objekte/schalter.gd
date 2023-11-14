extends StaticBody2D

var isConnected:bool = false

func _ready():
	$AnimatedSprite2D.frame = 1

func _process(_delta):
#	print(isConnected)
	pass

func schalter_triggered():
	$AnimatedSprite2D.frame = 0
	if isConnected && get_tree().get_nodes_in_group("Door")[0].canBeOpened:
		get_tree().get_nodes_in_group("Door")[0].open()
	else:
		$AnimatedSprite2D.frame = 1
		get_tree().get_nodes_in_group("Door")[0].close()
		
func schalter_test(katzPos):
	if (katzPos- position).length() < 100:
		schalter_triggered() 

func update(): 
	pass

func isConnectNoMore():
	isConnected = false
	schalter_triggered()

#func _on_timer_timeout():
#	schalter_triggered()
