extends StaticBody2D


func _on_area_2d_body_entered(body):
	for i in body.get_groups():
		if i == "Cutable":
			i.on_wireCUt()
#			print("CUT!!")
