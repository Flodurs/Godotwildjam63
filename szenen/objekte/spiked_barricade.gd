extends StaticBody2D



func _on_area_2d_area_entered(area):
	for i in area.get_groups():
		if i == "Cutable":
			area.on_wireCut()
#			print("CUT!!")
