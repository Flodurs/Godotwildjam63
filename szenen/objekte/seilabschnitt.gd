extends Node2D
var start:Vector2 = Vector2.ZERO
var ende:Vector2 = Vector2.ZERO
var richtung:Vector2 = Vector2.ZERO

func _ready():
#	start = $Line2D.get_point_position(0)  
#	ende = $Line2D.get_point_position(1)  
#	richtung = ende-start
	
	add_to_group("Cutable")

func add_point(point:Vector2):
	$Line2D.add_point(point)

func getVec() -> Vector2:
	return $Line2D.get_point_position(1) - $Line2D.get_point_position(0)

#func getYAtX(x:int) -> int:
#	var y = start.y + richtung.y*((x - start.x)/richtung.x)
#	return y
	
func on_wireCut():
	queue_free()
