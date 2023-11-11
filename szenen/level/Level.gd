extends Node2D

var seile = Array()
var pillars = Array()


func _ready():
	seile.append($Seilstueck)
	seile.append($Seilstueck2)
	seile.append($Seilstueck3)
	pillars.append($Pillar)
	pillars.append($Pillar2)
	pillars.append($Pillar3)
	pillars.append($Pillar4)
	pillars.append($Pillar5)
	pillars.append($Pillar6)
	pillars.append($Pillar7)
	
	for s in seile:
		for p in pillars:
			if (s.getYAtX(p.position.x) > p.position.y-p.seil_hoehe)&&(s.getYAtX(p.position.x) < p.position.y+10) :  #(seil vor pillar)und(seil nicht zu weit unter pillar) 
				if(p.position.x > min(s.get_point_position(0).x, s.get_point_position(1).x) && p.position.x < max(s.get_point_position(0).x, s.get_point_position(1).x)):  #und(sei lang genug)
					p.verdecken(s)
#	$Pillar2.Seilstuecke = $Pillar2.verdecken($Line2D)

	
