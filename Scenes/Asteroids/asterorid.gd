extends Area2D

@export var speed: float

func _process(_delta: float) -> void:
	position.x -= speed * _delta
