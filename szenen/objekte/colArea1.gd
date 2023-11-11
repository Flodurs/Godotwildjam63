extends Area2D

var toCenter:Vector2 = Vector2.ZERO

func _ready():
	var pillPos = $"..".global_position
	toCenter = pillPos - self.global_position



func _on_body_entered(body):
	var groups = body.get_groups()
	for i in groups:
		if i=="Seil":
			i.inputCollision(self)
