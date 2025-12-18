extends Marker2D

@export var big_asteroid_scene: PackedScene
@export var small_asteroid_scene: PackedScene
@export var medium_asteroid_scene: PackedScene

@export var min_y:float
@export var max_y:float

func create_asteriod(asteroid_scene: PackedScene) -> void:
	var asteroid_instance = asteroid_scene.instantiate()
	add_child(asteroid_instance)
	var random_y = randf_range(min_y, max_y)
	asteroid_instance.global_position.y = random_y
	
func _on_timer_timeout() -> void:
	create_asteriod(big_asteroid_scene)
