extends StaticBody2D



func _on_area_2d_area_entered(area):
	for i in area.get_groups():
		if i == "Cutable":
			$cutTimer.start()
			await $cutTimer.timeout
			area.on_wireCut()
#			print("CUT!!")
			for schalter in get_tree().get_nodes_in_group("Schalter"):
				schalter.isConnected = false
