extends StaticBody2D


@export var seil_hoehe:int = 20
var gewickelt:bool = false
const linkeKanteX:int = -20
const rechteKanteX:int = 20



func verdecken(seil:Line2D):
	if (seil.get_point_count() != 2):
		print("error: seil mit zu vielen punkten (oder zu wenig)")
	else:
		var start:Vector2 = seil.get_point_position(0)
		var richtung:Vector2 = seil.get_point_position(1)-seil.get_point_position(0)
		var punktLinks:Vector2 = Vector2.ZERO
		var punktRechts:Vector2 = Vector2.ZERO
		
		punktLinks.x = global_position.x + linkeKanteX
		punktLinks.y = start.y + richtung.y*((global_position.x + linkeKanteX - start.x)/richtung.x)
		punktRechts.x = global_position.x + rechteKanteX
		punktRechts.y = start.y + richtung.y*((global_position.x + rechteKanteX - start.x)/richtung.x)
		
		var verdeckungsLinie = Line2D.new()
		verdeckungsLinie. add_point(punktLinks)
		verdeckungsLinie.add_point(punktRechts)
		verdeckungsLinie.add_child()
