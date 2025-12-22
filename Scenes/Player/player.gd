extends CharacterBody2D

@export var speed: float
@export var laser_scene: PackedScene

func _physics_process(_delta: float) -> void:
	if GameManager.is_game_over:
		return
	if Input.is_action_just_pressed("fire"):
		create_laser()
	process_inputs()
	move_and_slide()

func process_inputs():
	var y_input = Input.get_axis("up","down")
	var x_input = Input.get_axis("left","right")
	velocity.x = x_input * speed
	velocity.y = y_input * speed
	
func create_laser():
	var laser_instance = laser_scene.instantiate()
	add_sibling(laser_instance)
	laser_instance.position = position


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroids"):
		GameManager.set_is_game_over(true)
		queue_free()
