extends Area2D

@export var min_move_speed: float
@export var max_move_speed: float
@export var min_rotation_speed: float
@export var max_rotation_speed: float
var explode_scene:PackedScene = preload("res://scenes/explosion.tscn")

@export var reward: int
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
	if is_a_laser:
		GameManager.add_score(reward)
	if is_the_player or is_a_laser:
		destroy()
		
func destroy():
	var explosion_instance = explode_scene.instantiate()
	get_parent().add_child(explosion_instance)
	explosion_instance.global_position = global_position
	queue_free()
