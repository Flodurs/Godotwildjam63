extends level_parent
var next_scene: String = "res://szenen/Levels/level_4.tscn"
var last_scene: String = "res://szenen/Levels/level_1.tscn"

func _process(_delta):
	if !zielErreicht && $Schalter.isConnected && $Objects/Door.canBeOpened:
		zielErreicht = true
