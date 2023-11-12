extends Node2D

var seilAbsch = preload("res://szenen/objekte/seilabschnitt.tscn")

var dropPos = Vector2.ZERO
var dropped = 1
var conList = Array()


var segment = SegmentShape2D.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	$dynLine/Area2D.monitorable = true
	
	$dynLine.add_point(Vector2(0, 0))
	$dynLine.add_point(get_tree().get_nodes_in_group("Katze")[0].global_position)
	
	$dynLine/Area2D.add_child($dynLine/Area2D/CollisionShape2D)
	segment.a = $dynLine.get_point_position(0)
	segment.b = $dynLine.get_point_position(1)
	$dynLine/Area2D/CollisionShape2D.shape = segment
	

func inputCollision(area):
	if conList.size()>0:	
		if area != conList[conList.size()-1]:
			conList.append(area) #add to conList
			addCon(conList[conList.size()-1], conList[conList.size()-2]) #addCon top 2 list
	else: 
		conList.append(area)






func addCon(a,b):
	var con = seilAbsch.instantiate()
	add_child(con)
	con.add_point(a.global_position)
	con.add_point(b.global_position)
#	con.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$dynLine.set_point_position(1, get_tree().get_nodes_in_group("Katze")[0].global_position)
	if(conList.size() >= 1):
		$dynLine.set_point_position(0, conList[conList.size()-1].global_position)
	
	segment.a = $dynLine.get_point_position(0)
	segment.b = $dynLine.get_point_position(1)
	$dynLine/Area2D/CollisionShape2D.shape = segment
	
	

	

#func getTopAbschnitt():
#	return get_tree().get_nodes_in_group("Seilabschnitt")[get_tree().get_nodes_in_group("Seilabschnitt").size()-1]
#
#func getIndFromTop(index):
#	return get_tree().get_nodes_in_group("Seilabschnitt")[get_tree().get_nodes_in_group("Seilabschnitt").size()-(1+index)]
#
	
	
	
	
			
		
	
