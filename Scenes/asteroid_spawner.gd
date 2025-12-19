extends Marker2D

@export var min_y:float
@export var max_y:float
@export var asteroids_list: Array[PackedScene]

func create_asteriod() -> void:
	var asteroid_scene = asteroids_list.pick_random()
	var asteroid_instance = asteroid_scene.instantiate()
	add_child(asteroid_instance)
	var random_y = randf_range(min_y, max_y)
	asteroid_instance.global_position.y = random_y
	
func _on_timer_timeout() -> void:
	create_asteriod()
