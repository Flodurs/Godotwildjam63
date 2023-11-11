extends Line2D

var start:Vector2 = Vector2.ZERO
var ende:Vector2 = Vector2.ZERO
var richtung:Vector2 = Vector2.ZERO


func _ready():
	start = get_point_position(0)  
	ende = get_point_position(1)  
	richtung = ende-start
	add_to_group("Seile")
	
func platzieren(p1:Vector2, p2:Vector2):
	pass

func getYAtX(x:int) -> int:
	var y = start.y + richtung.y*((x - start.x)/richtung.x)
	return y
