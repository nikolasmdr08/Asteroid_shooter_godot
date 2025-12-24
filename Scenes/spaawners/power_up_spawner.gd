extends Node2D

@export var power_up_scene: PackedScene
@export var y_min: int
@export var y_max: int
@export var x_min: int
@export var x_max: int

@onready var timer = $Timer

func _ready() -> void:
	pass # Replace with function body.

func _on_timer_timeout() -> void:
	create_power_up()
	
func create_power_up():
	if GameManager.is_game_over:
		timer.stop()
		return	
	var power_up_instance = power_up_scene.instantiate()
	add_child(power_up_instance)
	power_up_instance.position = Vector2(randi_range(x_min,x_max),randi_range(y_min,y_max))
