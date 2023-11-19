extends StaticBody2D

var isConnected:bool = false
var audioAn = preload("res://MusicRelatedFiles/schlalterAn.wav")
var audioAus = preload("res://MusicRelatedFiles/schlalterAus.wav")

func _ready():
	$AnimatedSprite2D.frame = 1 #aus

func _process(_delta):
#	print(isConnected)
	pass

func schalter_triggered():
	$AnimatedSprite2D.frame = 0 #an
	if (isConnected || get_tree().get_first_node_in_group("LevelNode").zielErreicht) && get_tree().get_nodes_in_group("Door")[0].canBeOpened:
		get_tree().get_nodes_in_group("Door")[0].open()
		$audioStream.set_stream(audioAn)
		$audioStream.play()
	else:
		$AnimatedSprite2D.frame = 1 #aus
		get_tree().get_nodes_in_group("Door")[0].close()
		
func schalter_test(katzPos):
	if (katzPos- position).length() < 200:
		schalter_triggered() 

func update(): 
	pass

func isConnectNoMore():
	isConnected = false
	$audioStream.set_stream(audioAus)
	$audioStream.play()
	schalter_triggered()

#func _on_timer_timeout():
#	schalter_triggered()
