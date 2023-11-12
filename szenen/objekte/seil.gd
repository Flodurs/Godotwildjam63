extends Node2D

var seilAbsch = preload("res://szenen/objekte/seilabschnitt.tscn")

var dropPos = Vector2.ZERO
var dropped = 1
var conList = Array()
var ziehtSeil:bool = false
var canAtt: bool = true

var segment = SegmentShape2D.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	$dynLine/Area2D.monitorable = true
	
	

func inputCollision(area):
	if(canAtt):
		if conList.size()>0:	
			if area != conList[conList.size()-1]:
				conList.append(area) #add to conList
				addCon(conList[conList.size()-1], conList[conList.size()-2]) #addCon top 2 list
		else: 
			conList.append(area)
			addCon(conList[conList.size()-1], get_tree().get_nodes_in_group("Wolle")[0])
		
		canAtt = false
		$colTimer.start()






func addCon(a,b):
	var con = seilAbsch.instantiate()
	add_child(con)
	con.add_point(a.global_position)
	con.add_point(b.global_position)
	con.setup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if ziehtSeil:
		segment.a = $dynLine.get_point_position(0)
		segment.b = $dynLine.get_point_position(1)
		$dynLine/Area2D/CollisionShape2D.shape = segment
		
		$dynLine.set_point_position(1, get_tree().get_nodes_in_group("maulPosi")[0].global_position)
		if(conList.size() >= 1):
			var con = conList.back()
			$dynLine.set_point_position(0, con.getGloPos())
			
		#abloes logik:
		if(get_tree().get_nodes_in_group("Seilabschnitt").size() >= 1):
			var lastSeg =  get_tree().get_nodes_in_group("Seilabschnitt").back()
			var vectLastSeg = -lastSeg.getVec()
			var vecCurr = $dynLine.get_point_position(1) - $dynLine.get_point_position(0)
			var vecZone = conList[conList.size()-1].toCenter
			
			var lastAngle = vecZone.angle_to(vectLastSeg)
			var currAngle = vecCurr.angle_to(vecZone)
			var angle =  abs( (lastAngle) + (currAngle) )
			if(angle > deg_to_rad(180)):
				abloesen()
				
		for p in get_tree().get_nodes_in_group("Pillar"):
			if (getYAtX(p.position.x) > p.position.y-p.seil_hoehe)&&(getYAtX(p.position.x) < p.position.y+10)||(getXAtY(p.position.y) > p.position.x+p.linkeKanteX && getXAtY(p.position.y) < p.position.x+p.rechteKanteX) :  #(seil vor pillar)und(seil nicht zu weit unter pillar) 
				if(p.position.x > min($dynLine.get_point_position(0).x, $dynLine.get_point_position(1).x) && p.position.x < max($dynLine.get_point_position(0).x, $dynLine.get_point_position(1).x)):  #und(sei lang genug)
					p.verdecken(self)
					
	
	
func abloesen():
	conList.pop_back()
	get_tree().get_nodes_in_group("Seilabschnitt")[get_tree().get_nodes_in_group("Seilabschnitt").size()-1].queue_free()
	if conList.size() >0:
		$dynLine.set_point_position(0, conList[conList.size()-1].global_position)
	else:
		$dynLine.set_point_position(0, get_tree().get_nodes_in_group("Wolle")[0].global_position)
	

func _on_col_timer_timeout():
	canAtt = true

func startWolling():
	$dynLine/Area2D.monitorable = true
	$dynLine.add_point(get_tree().get_nodes_in_group("Wolle")[0].global_position)
	$dynLine.add_point( get_tree().get_nodes_in_group("maulPosi")[0].global_position)
	
	ziehtSeil = true


func stopWolling():
	ziehtSeil= false
	$dynLine.remove_point(1)
	$dynLine.remove_point(0)
	for i in get_tree().get_nodes_in_group("Seilabschnitt"):
		i.queue_free()
	while conList.size() > 0:
		conList.pop_back()
	for i in get_tree().get_nodes_in_group("Verdeckung"):
		i.queue_free()

func getYAtX(x:int) -> int:
	var start = $dynLine.get_point_position(0)  
	var ende = $dynLine.get_point_position(1)  
	var richtung = ende-start
	
	var y = start.y + richtung.y*((x - start.x)/richtung.x)
	return y

func getXAtY(y:int) -> int:
	var start = $dynLine.get_point_position(0)  
	var ende = $dynLine.get_point_position(1)  
	var richtung = ende-start
	
	var x = start.x + richtung.x*((y - start.y)/richtung.y)
	return x

func get_point_count() -> int:
	return $dynLine.get_point_count()

func get_point_position(n) -> Vector2:
	return $dynLine.get_point_position(n)
