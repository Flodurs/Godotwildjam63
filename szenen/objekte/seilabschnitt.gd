extends Area2D
var hitflag = 0
var primus = 1
var hitPoint = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Line2D.points.size() == 2:
		$CollisionShape2D.get_shape().a=$Line2D.points[0] 
		$CollisionShape2D.get_shape().b=$Line2D.points[1]

func getHitFlag():
	if hitflag==1:
		hitflag=0
		return 1
	return 0
func getHitPoint():
	return hitPoint




		
	

	
