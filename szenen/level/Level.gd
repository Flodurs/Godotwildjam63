extends Node2D

func _ready():
	$Pillar2.Seilstuecke = $Pillar2.verdecken($Line2D)
#	$Pillar2.add_child($Pillar2.Seilstuecke)
#	$Pillar2.Seilstuecke.visible= true
	
