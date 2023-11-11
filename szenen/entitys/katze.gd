extends CharacterBody2D
@export var speed = 400

var playAudioFlag = 0
var hatWolle: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player") # Replace with function body.
	
	
func _physics_process(_delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("mRight"):
		$AnimatedSprite2D.flip_h = 1
		velocity.x += 1
		
	if Input.is_action_pressed("mLeft"):
		$AnimatedSprite2D.flip_h = 0
		
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("wolleInteraktion"):
		if(hatWolle):
			dropWolle()
			hatWolle = false
		else:
			hebeaufWolle()

func dropWolle():
	var w = get_tree().get_nodes_in_group("Wolle")
	var posi = w[0].global_position
	remove_child(w[0])
	$"..".add_child(w[0])
	w[0].position = Vector2(posi.x, posi.y + 15)

func hebeaufWolle():
	var w = get_tree().get_nodes_in_group("Wolle")
	var posi = w[0].global_position
	var mPos = $kneulPosi.global_position
	if (abs(posi-mPos).length() < 100):
		$"..".remove_child(w[0])
		add_child(w[0])
		w[0].position = $kneulPosi.position
		hatWolle = true
