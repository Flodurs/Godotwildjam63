extends level_parent

var next_scene: String = "res://szenen/Levels/level_6.tscn"
var last_scene: String = "res://szenen/Levels/level_3.tscn"

func _process(_delta):
	if !zielErreicht && $Schalter.isConnected && $Door.canBeOpened:
		zielErreicht = true
