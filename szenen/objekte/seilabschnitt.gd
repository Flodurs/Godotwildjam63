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
		if (getYAtX(p.position.x) > p.position.y-p.seil_hoehe)&&(getYAtX(p.position.x) < p.position.y+10)||(getXAtY(p.position.y-p.seil_hoehe) > p.position.x+p.linkeKanteX && getXAtY(p.position.y-p.seil_hoehe) < p.position.x+p.rechteKanteX) :  #(seil vor pillar)und(seil nicht zu weit unter pillar) 
			if(p.position.x > min(get_point_position(0).x, get_point_position(1).x) && p.position.x < max(get_point_position(0).x, get_point_position(1).x)):  #und(sei lang genug)
				p.verdecken(self)
					

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
