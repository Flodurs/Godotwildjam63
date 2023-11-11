extends Area2D
@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("mRight"):
		velocity.x += 1
	if Input.is_action_pressed("mLeft"):
		velocity.x -= 1
	if Input.is_action_pressed("mDown"):
		velocity.y += 1
	if Input.is_action_pressed("mUp"):
		velocity.y -= 1
		
	velocity = velocity.normalized() * speed
	position += velocity * delta

