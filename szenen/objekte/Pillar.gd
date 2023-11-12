extends StaticBody2D


@export var seil_hoehe:int = 60
var gewickelt:bool = false
const linkeKanteX:int = -20
const rechteKanteX:int = 20

var dynVerdeck: Node2D = null

func _ready():
	add_to_group("Pillar")

func updateCover():
	for i in get_tree().get_nodes_in_group("Seile"):
		i.queue_free()
	
func _process(_delta):
	if dynVerdeck != null:
		dynVerdeck.queue_free()
		dynVerdeck = null

func verdecken(seil): #seil muss typ Seilstueck haben
	if (seil.get_point_count() != 2):
		print("error: seil mit zu vielen punkten (oder zu wenig)")
	else:
		var start:Vector2 = seil.get_point_position(0)
		var richtung:Vector2 = seil.get_point_position(1)-seil.get_point_position(0)
		var punktLinks:Vector2 = Vector2.ZERO
		var punktRechts:Vector2 = Vector2.ZERO
		
		punktLinks.x = position.x + linkeKanteX
		punktLinks.y = seil.getYAtX(punktLinks.x) 
		punktRechts.x = global_position.x + rechteKanteX
		punktRechts.y = seil.getYAtX(punktRechts.x) 
		
		
		var verdeckungsLinie = Line2D.new()
		verdeckungsLinie.width = 5
		verdeckungsLinie.default_color = "691717"
		
		verdeckungsLinie. add_point(punktLinks - position)
		verdeckungsLinie.add_point(punktRechts - position)
		add_child(verdeckungsLinie)
		verdeckungsLinie.visible = true
		verdeckungsLinie.add_to_group("Verdeckung")
		
		for g in seil.get_groups():
			if g == "SeilMain":
				dynVerdeck = verdeckungsLinie
		
