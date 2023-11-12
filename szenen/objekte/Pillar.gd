extends StaticBody2D


@export var seil_hoehe:int = -39
var gewickelt:bool = false
const linkeKanteX:int = -15
const rechteKanteX:int = 15

var dynVerdeck: Node2D = null

func _ready():
	add_to_group("Pillar")
	var seil_hoehe = $hitBox_center.position.y

	
func _process(_delta):
	if dynVerdeck != null:
		dynVerdeck.queue_free()

func update():
	var chi = get_children()
	for c in chi:
		for i in c.get_groups():
			if i=="Verdeckung":
				c.queue_free()
	for s in get_tree().get_nodes_in_group("Seilabschnitt"):
		if (s.getYAtX(position.x) > position.y-seil_hoehe)&&(s.getYAtX(position.x) < position.y+10)||(s.getXAtY(position.y) > position.x+linkeKanteX && s.getXAtY(position.y) < position.x+rechteKanteX) :  #(seil vor pillar)und(seil nicht zu weit unter pillar) 
			if(position.x > min(s.get_point_position(0).x, s.get_point_position(1).x) || position.x < max(s.get_point_position(0).x, s.get_point_position(1).x)):  #und(sei lang genug)
				verdecken(s)

func verdecken(seil): #seil muss typ Seilstueck haben
	if (seil.get_point_count() != 2):
		print("error: seil mit zu vielen punkten (oder zu wenig)")
	else:
		var start:Vector2 = seil.get_point_position(0)
		var ende:Vector2 = seil.get_point_position(1)
		var richtung:Vector2 = seil.get_point_position(1)-seil.get_point_position(0)
		var punktLinks:Vector2 = Vector2.ZERO
		var punktRechts:Vector2 = Vector2.ZERO
		
		punktLinks.x = max(position.x + linkeKanteX, min(start.x, ende.x))
		punktLinks.y = seil.getYAtX(punktLinks.x) 
		punktRechts.x = min(global_position.x + rechteKanteX, max(start.x, ende.x))
		punktRechts.y = seil.getYAtX(punktRechts.x) 
		
		if !(punktLinks.x > punktRechts.x ):
#		if true:
			var verdeckungsLinie = Line2D.new()
			verdeckungsLinie.width = 5
			verdeckungsLinie.default_color = "691717"
			
			verdeckungsLinie. add_point(punktLinks - position)
			verdeckungsLinie.add_point(punktRechts - position)
			add_child(verdeckungsLinie)
			verdeckungsLinie.visible = true
			verdeckungsLinie.z_index =5
			verdeckungsLinie.add_to_group("Verdeckung")
			
			for g in seil.get_groups():
				if g == "SeilMain":
					dynVerdeck = verdeckungsLinie
	
