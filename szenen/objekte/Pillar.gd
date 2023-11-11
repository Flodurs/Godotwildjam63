extends StaticBody2D


@export var seil_hoehe:int = 20
var gewickelt:bool = false
const linkeKanteX:int = -20
const rechteKanteX:int = 20

var Seilstuecke = []

#func _ready():
#	var linie = Line2D.new()
#	linie.add_child()


func verdecken(seil:Line2D) -> Line2D:
	if (seil.get_point_count() != 2):
		print("error: seil mit zu vielen punkten (oder zu wenig)")
		return Line2D.new()
	else:
		var start:Vector2 = seil.get_point_position(0)
		var richtung:Vector2 = seil.get_point_position(1)-seil.get_point_position(0)
		var punktLinks:Vector2 = Vector2.ZERO
		var punktRechts:Vector2 = Vector2.ZERO
		
		punktLinks.x = position.x + linkeKanteX
		punktLinks.y = start.y + richtung.y*((position.x + linkeKanteX - start.x)/richtung.x)
		punktRechts.x = global_position.x + rechteKanteX
		punktRechts.y = start.y + richtung.y*((position.x + rechteKanteX - start.x)/richtung.x)
		print(start)
		print(richtung)
		print(position)
		
		
		var verdeckungsLinie = Line2D.new()
		verdeckungsLinie. add_point(punktLinks- position)
		verdeckungsLinie.add_point(punktRechts - position)
		add_child(verdeckungsLinie)
		verdeckungsLinie.visible = true
		
		print(verdeckungsLinie.get_point_position(0))
		print(verdeckungsLinie.get_point_position(1))
		
		return verdeckungsLinie
