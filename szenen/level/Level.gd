extends Node2D
class_name level_parent

var zielErreicht:bool = false
var kneulTextur = preload("res://assets/sprites/wollekneule_schmutzig.png") # kann mit suaber ausgetauscht werden
var haufenTextur = preload("res://assets/sprites/wollhaufen_schmutzig.png")


func change_scene(target):
	get_tree().change_scene_to_file(target)

func _ready():
	pass
#	for s in get_tree().get_nodes_in_group("Seilabschnitt"):
#		for p in get_tree().get_nodes_in_group("Pillar"):
#			if (s.getYAtX(p.position.x) > p.position.y-p.seil_hoehe)&&(s.getYAtX(p.position.x) < p.position.y+10) :  #(seil vor pillar)und(seil nicht zu weit unter pillar) 
#				if(p.position.x > min(s.get_point_position(0).x, s.get_point_position(1).x) && p.position.x < max(s.get_point_position(0).x, s.get_point_position(1).x)):  #und(sei lang genug)
#					p.verdecken(s)
#		for b in get_tree().get_nodes_in_group("Background"):
#			if (s.getYAtX(b.position.x) > b.position.y-b.seil_hoehe)&&(s.getYAtX(b.position.x) < b.position.y+10) :  #(seil vor pillar)und(seil nicht zu weit unter pillar) 
#				if(b.position.x > min(s.get_point_position(0).x, s.get_point_position(1).x) && b.position.x < max(s.get_point_position(0).x, s.get_point_position(1).x)):  #und(sei lang genug)
#					b.verdecken(s)


func _process(delta):
	pass
		
