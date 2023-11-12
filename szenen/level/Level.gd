extends Node2D
class_name level_parent

func change_scene(target):
	get_tree().change_scene_to_file(target)

func _ready():
	
	for s in get_tree().get_nodes_in_group("Seile"):
		for p in get_tree().get_nodes_in_group("Pillar"):
			if (s.getYAtX(p.position.x) > p.position.y-p.seil_hoehe)&&(s.getYAtX(p.position.x) < p.position.y+10) :  #(seil vor pillar)und(seil nicht zu weit unter pillar) 
				if(p.position.x > min(s.get_point_position(0).x, s.get_point_position(1).x) && p.position.x < max(s.get_point_position(0).x, s.get_point_position(1).x)):  #und(sei lang genug)
					p.verdecken(s)
#		for b in get_tree().get_nodes_in_group("Background"):
#			if (s.getYAtX(b.position.x) > b.position.y-b.seil_hoehe)&&(s.getYAtX(b.position.x) < b.position.y+10) :  #(seil vor pillar)und(seil nicht zu weit unter pillar) 
#				if(b.position.x > min(s.get_point_position(0).x, s.get_point_position(1).x) && b.position.x < max(s.get_point_position(0).x, s.get_point_position(1).x)):  #und(sei lang genug)
#					b.verdecken(s)
#
