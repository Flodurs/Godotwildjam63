extends level_parent
var next_scene: String = "res://szenen/Levels/level_1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !zielErreicht && $Objects/Schalter.isConnected && $Objects/Door.canBeOpened:
		zielErreicht = true

