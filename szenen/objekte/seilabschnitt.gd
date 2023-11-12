extends Node2D
var start:Vector2 = Vector2.ZERO
var ende:Vector2 = Vector2.ZERO
var richtung:Vector2 = Vector2.ZERO

func _ready():
	
	add_to_group("Cutable")
	
func setup():
	start = $Line2D.get_point_position(0)  
	ende = $Line2D.get_point_position(1)  
	richtung = ende-start
	
	for p in get_tree().get_nodes_in_group("Pillar"):
		drawCheck(p, self)
					

func add_point(point:Vector2):
	$Line2D.add_point(point)

func getVec() -> Vector2:
	return ($Line2D.get_point_position(1) - $Line2D.get_point_position(0))

func getYAtX(x:int) -> int:
	var y = start.y + richtung.y*((x - start.x)/richtung.x)
	return y
	
func getXAtY(y:int) -> int:
	var x = start.x + richtung.x*((y - start.y)/richtung.y)
	return x
	
func get_point_position(n) -> Vector2:
	return $Line2D.get_point_position(n)
	
func get_point_count() -> int:
	return $Line2D.get_point_count()
	
func on_wireCut():
	queue_free()

func drawCheck(p, s):
	var draw: bool = true
	if s.getYAtX(p.position.x+p.linkeKanteX) < p.position.y + p.seil_hoehe: #seil zu hoch (=dahinter)
		draw = false
		if(min(s.get_point_position(0).y, s.get_point_position(1).y) > p.position.y + p.seil_hoehe):
			draw = true #unless rope ends before that
#		print("a")
	else: if (s.getYAtX(p.position.x+p.rechteKanteX) < p.position.y + p.seil_hoehe): #seil zu hoch[rechts]
		draw = false
		if(min(s.get_point_position(0).y, s.get_point_position(1).y) > p.position.y + p.seil_hoehe):
			draw = true #unless rope ends before that
#		print("b")
	#seil unter pillar
	else: if(s.getYAtX(p.position.x+p.linkeKanteX) > p.position.y-20 && s.getYAtX(p.position.x+p.rechteKanteX)> p.position.y-20):
		draw = false
#		print("c")
	#seil komplett links von pillar
	else: if(max(s.get_point_position(0).x, s.get_point_position(1).x) < p.position.x + p.linkeKanteX):
		draw=false
#		print("d")
	#seil komplett rechts von pillar
	else: if(min(s.get_point_position(0).x, s.get_point_position(1).x) > p.position.x + p.rechteKanteX):
		draw = false
#		print("e")
	
	if draw:
		p.verdecken(self)
#	if (getYAtX(p.position.x) > p.position.y-p.seil_hoehe)&&(getYAtX(p.position.x) < p.position.y+10)||(getXAtY(p.position.y) > p.position.x+p.linkeKanteX && getXAtY(p.position.y) < p.position.x+p.rechteKanteX) :  #(seil vor pillar)und(seil nicht zu weit unter pillar) 
#			if(p.position.x > min(get_point_position(0).x, get_point_position(1).x) || p.position.x < max(get_point_position(0).x, get_point_position(1).x)):  #und(sei lang genug)
#				p.verdecken(self)
