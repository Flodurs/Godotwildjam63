extends Node
var soundTrack = preload("res://MusicRelatedFiles/soundTrack.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.set_stream(soundTrack)
	$AudioStreamPlayer2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
