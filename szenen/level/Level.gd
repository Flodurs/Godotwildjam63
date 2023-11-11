extends Node2D



func _ready():
	
	for s in get_tree().get_nodes_in_group("Seile"):
		for p in get_tree().get_nodes_in_group("Pillar"):
			if (s.getYAtX(p.position.x) > p.position.y-p.seil_hoehe)&&(s.getYAtX(p.position.x) < p.position.y+10) :  #(seil vor pillar)und(seil nicht zu weit unter pillar) 
				if(p.position.x > min(s.get_point_position(0).x, s.get_point_position(1).x) && p.position.x < max(s.get_point_position(0).x, s.get_point_position(1).x)):  #und(sei lang genug)
					p.verdecken(s)
#	$Pillar2.Seilstuecke = $Pillar2.verdecken($Line2D)


	
#	var knaeul = get_tree().get_nodes_in_group("Wolle")
#	var cat = get_tree().get_nodes_in_group("Player")
#	if knaeul.size() >0 && cat.size > 0:
#		for k in knaeul:
#			for c in cat:
#				c.add_child(k)

	
