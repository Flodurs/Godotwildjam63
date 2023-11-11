extends CharacterBody2D
@export var speed = 400

var playAudioFlag = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("mRight"):
		$AnimatedSprite2D.flip_v = 1
		velocity.x += 1
		
	if Input.is_action_pressed("mLeft"):
		$AnimatedSprite2D.flip_v = 0
		
		velocity.x -= 1
	if Input.is_action_pressed("mDown"):
		velocity.y += 1
	if Input.is_action_pressed("mUp"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
		if playAudioFlag == 0:
			$AudioStreamPlayer.play()
			playAudioFlag = 1
	else:
		playAudioFlag=0
		$AnimatedSprite2D.stop()
		$AudioStreamPlayer.stop()
		
	move_and_slide()

