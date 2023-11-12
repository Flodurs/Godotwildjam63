extends Area2D

@onready var wind_scene = preload("res://szenen/objekte/wind.tscn")
@onready var spawn_area = $CollisionShape2D.shape.extents
@onready var origin = $CollisionShape2D.global_position - spawn_area

func wind_emitter():
	var x: float = randi_range(origin.x, spawn_area.x)
	var y: float = randi_range(origin.y, spawn_area.y)
	var rand_scale: float = randf_range(0.5, 1)
	
	var random_position: Vector2 = Vector2(x, y)
	var wind = wind_scene.instantiate()
	wind.global_position = random_position
	wind.scale = Vector2(rand_scale, rand_scale)
	$".".add_child(wind)
	print(rand_scale)
func _on_timer_timeout():
	wind_emitter()
	$Timer.wait_time = randf_range(0.5, 3)
