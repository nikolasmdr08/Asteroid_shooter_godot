extends Marker2D

@export var min_y:float
@export var max_y:float
@export var asteroids_list: Array[PackedScene]
@onready var timer: Timer = $Timer

var instances = 1

func create_asteriod() -> void:
	if GameManager.is_game_over:
		timer.stop()
	var asteroid_scene = asteroids_list.pick_random()
	var asteroid_instance = asteroid_scene.instantiate()
	add_child(asteroid_instance)
	var random_y = randf_range(min_y, max_y)
	asteroid_instance.global_position.y = random_y
	
func _on_timer_timeout() -> void:
	for i in range(instances):
		create_asteriod()
