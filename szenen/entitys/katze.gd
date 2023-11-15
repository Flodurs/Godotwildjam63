extends CharacterBody2D
@export var speed = 400

var playAudioFlag = 0
var hatWolle: bool = true

@onready var maulPosi = $maulPosi.position.x
const tweenTime = 0.5

const kneul_schmutz = preload("res://assets/sprites/wollekneule_schmutzig.png")
const haufen_schmutz = preload("res://assets/sprites/wollhaufen_schmutzig.png")
const kneul_sauber = preload("res://assets/sprites/wollekneule_sauber.png")
const haufen_sauber = preload("res://assets/sprites/wollhaufen_sauber.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player") # Replace with function body.
	
	
func _physics_process(_delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("mRight"):
		$AnimatedSprite2D.flip_h = 1
		$kneulPosi.position.x = abs($kneulPosi.position.x)
		velocity.x += 1
		if $maulPosi.position.x != abs(maulPosi):
			var twee = create_tween()
			twee.tween_property($maulPosi, "position:x", abs(maulPosi), tweenTime)
		
	if Input.is_action_pressed("mLeft"):
		$AnimatedSprite2D.flip_h = 0
		$kneulPosi.position.x = -abs($kneulPosi.position.x)
		if $maulPosi.position.x != -abs(maulPosi):
			var twee = create_tween()
			twee.tween_property($maulPosi, "position:x", -abs(maulPosi), tweenTime)
		
		
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
	if Input.is_action_just_pressed("Interaktion"):
		if get_tree().get_nodes_in_group("Schalter").size() > 0:
			get_tree().get_nodes_in_group("Schalter")[0].schalter_test($maulPosi.global_position)
		if(hatWolle):
			dropWolle()
			hatWolle = false
			get_tree().get_nodes_in_group("SeilMain")[0].startWolling()
		else:
			hebeaufWolle()
				

func dropWolle():
	var w = get_tree().get_nodes_in_group("Wolle")
	var posi = w[0].global_position
	$kneulPosi.remove_child(w[0])
	$"..".add_child(w[0])
	w[0].position = Vector2(posi.x, posi.y + 20)
	w[0].set_texture(haufen_schmutz)

func hebeaufWolle() -> bool:
	var w = get_tree().get_nodes_in_group("Wolle")
	var posi = w[0].global_position
	var mPos = $kneulPosi.global_position
	if (abs(posi-mPos).length() < 100):
		$"..".remove_child(w[0])
		$kneulPosi.add_child(w[0])
		w[0].position = Vector2.ZERO
		w[0].set_texture(kneul_schmutz)
		hatWolle = true
		get_tree().get_nodes_in_group("SeilMain")[0].stopWolling()
		return true
	else:
		return false
