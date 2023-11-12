extends Area2D

func getSeil() -> Node2D:
	return $"../.."

func on_wireCut():
	$"../..".stopWolling()
