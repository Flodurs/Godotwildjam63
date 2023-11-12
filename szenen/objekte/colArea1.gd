extends Area2D

var toCenter:Vector2 = Vector2.ZERO

func _ready():
	var pillPos = $"..".global_position
	toCenter = pillPos - self.global_position
	monitoring = true






func _on_area_entered(area):
	var groups = area.get_groups()
	for i in groups:
		if i=="Seil":
			area.getSeil().inputCollision(self)
