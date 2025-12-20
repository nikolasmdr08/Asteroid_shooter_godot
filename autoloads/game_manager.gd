extends Node

var score = 0

func _process(delta: float) -> void:
	pass

func add_score(points):
	score+=points
	print(score)
