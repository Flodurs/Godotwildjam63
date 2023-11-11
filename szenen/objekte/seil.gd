extends Node2D

var seilAbsch = preload("res://szenen/objekte/seilabschnitt.tscn")

var dropPos = Vector2.ZERO
var dropped = 1
var seilList = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var catPos = get_tree().get_nodes_in_group("Katze")[0].position
	
#Create first Seil Segment
	if dropped == 1:
		if get_tree().get_nodes_in_group("Seilabschnitt").size() == 0:
			var sA = seilAbsch.instantiate()
			
			add_child(sA)
			get_tree().get_nodes_in_group("Seilabschnitt")[0].get_node("Line2D").add_point(dropPos)
			get_tree().get_nodes_in_group("Seilabschnitt")[0].get_node("Line2D").add_point(catPos)
	
	
	if get_tree().get_nodes_in_group("Seilabschnitt").size() == 0:
		return 
		
#Process top Segment
	get_tree().get_nodes_in_group("Seilabschnitt")[0].get_node("Line2D").set_point_position(get_tree().get_nodes_in_group("Seilabschnitt").size(),catPos)


	
	
	
			
		
	
