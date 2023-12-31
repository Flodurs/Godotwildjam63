extends Area2D

var toCenter:Vector2 = Vector2.ZERO

func _ready():
	var pillPos = $"../hitBox_center".global_position
	toCenter = pillPos - self.global_position
	monitoring = true


func getGloPos() -> Vector2:
	return global_position

func _on_area_entered(area):
	var groups = area.get_groups()
	for i in groups:
		if i=="Seil":
			area.getSeil().inputCollision(self)
			$"..".isConnected = true
		
