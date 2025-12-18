extends Area2D

@export var speed: float

func _process(delta: float) -> void:
	position.x += speed * delta
