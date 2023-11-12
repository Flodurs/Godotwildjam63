extends Node2D

var seilAbsch = preload("res://szenen/objekte/seilabschnitt.tscn")

var dropPos = Vector2.ZERO
var dropped = 1
var conList = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	

func inputCollision(area):
	pass
#add to conList

#addCon top 2 list


	
	



func addCon(a,b):
	var con = seilAbsch.instantiate()
	add_child(seilAbsch)
	getTopAbschnitt().get_node("Line2D").add_point(a.position)
	getTopAbschnitt().get_node("Line2D").add_point(b.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	

func getTopAbschnitt():
	return get_tree().get_nodes_in_group("Seilabschnitt")[get_tree().get_nodes_in_group("Seilabschnitt").size()-1]
	
func getIndFromTop(index):
	return get_tree().get_nodes_in_group("Seilabschnitt")[get_tree().get_nodes_in_group("Seilabschnitt").size()-(1+index)]
	
	
	
	
	
			
		
	
