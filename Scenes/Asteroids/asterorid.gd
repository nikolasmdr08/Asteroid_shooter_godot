extends Area2D

@export var min_move_speed: float
@export var max_move_speed: float
@export var min_rotation_speed: float
@export var max_rotation_speed: float
var move_speed: float
var rotation_speed: float

func _ready() -> void:
	move_speed = randf_range(min_move_speed, max_move_speed)
	rotation_speed = randf_range(min_rotation_speed, max_rotation_speed)

func _process(_delta: float) -> void:
	position.x -= move_speed * _delta
	rotation += rotation_speed * _delta

func _on_area_entered(area: Area2D) -> void:
	var is_the_player = area.is_in_group("player")
	var is_a_laser = area.is_in_group("laser")
	if is_the_player or is_a_laser:
		queue_free()
