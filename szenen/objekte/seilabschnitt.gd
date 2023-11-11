extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CollisionShape2D.get_shape().a=$Line2D.points[0] 
	$CollisionShape2D.get_shape().b=$Line2D.points[1]






func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(body.owner())
		
	
