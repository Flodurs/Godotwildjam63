extends Node2D

var seilAbsch = preload("res://szenen/objekte/seilabschnitt.tscn")

var dropPos = Vector2.ZERO
var dropped = 1
var conList = Array()
var ziehtSeil:bool = true
var canAtt: bool = true

var segment = SegmentShape2D.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	$dynLine/Area2D.monitorable = true
	
	$dynLine.add_point(Vector2(0, 0))
	$dynLine.add_point(get_tree().get_nodes_in_group("Katze")[0].global_position)
	
	segment.a = $dynLine.get_point_position(0)
	segment.b = $dynLine.get_point_position(1)
	$dynLine/Area2D/CollisionShape2D.shape = segment
	

func inputCollision(area):
	if(canAtt):
		if conList.size()>0:	
			if area != conList[conList.size()-1]:
				conList.append(area) #add to conList
				addCon(conList[conList.size()-1], conList[conList.size()-2]) #addCon top 2 list
		else: 
			conList.append(area)
		
		canAtt = false
		$colTimer.start()






func addCon(a,b):
	var con = seilAbsch.instantiate()
	add_child(con)
	con.add_point(a.global_position)
	con.add_point(b.global_position)
#	con.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	segment.a = $dynLine.get_point_position(0)
	segment.b = $dynLine.get_point_position(1)
	$dynLine/Area2D/CollisionShape2D.shape = segment
	
	if ziehtSeil:
		$dynLine.set_point_position(1, get_tree().get_nodes_in_group("Katze")[0].global_position)
		if(conList.size() >= 1):
			$dynLine.set_point_position(0, conList[conList.size()-1].global_position)
			
		#abloes logik:
		if(get_tree().get_nodes_in_group("Seilabschnitt").size() > 1):
			var lastSeg =  get_tree().get_nodes_in_group("Seilabschnitt").back()
			var vectLastSeg = -lastSeg.getVec()
			var vecCurr = $dynLine.get_point_position(1) - $dynLine.get_point_position(0)
			var vecZone = conList[conList.size()-1].toCenter
			
			var lastAngle = vecZone.angle_to(vectLastSeg)
			var currAngle = vecCurr.angle_to(vecZone)
			var angle =  abs( (lastAngle) + (currAngle) )
			print(Vector3(rad_to_deg(lastAngle),rad_to_deg(currAngle),rad_to_deg(angle)))
			if(angle > deg_to_rad(182)):
				abloesen()
	
	
func abloesen():
	print("abloesen")
	conList.pop_back()
	get_tree().get_nodes_in_group("Seilabschnitt")[get_tree().get_nodes_in_group("Seilabschnitt").size()-1].queue_free()
	$dynLine.set_point_position(0, conList[conList.size()-1].global_position)
	
	



func _on_col_timer_timeout():
	canAtt = true
