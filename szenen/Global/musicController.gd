extends Node
var soundTrack = preload("res://MusicRelatedFiles/soundTrack.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.volume_db = -40
	$AudioStreamPlayer2D.play()
	var tween = create_tween()
	tween.tween_property($AudioStreamPlayer2D, "volume_db", -10, 1.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#func _on_audio_stream_player_2d_finished():
#	$AudioStreamPlayer2D.play()
