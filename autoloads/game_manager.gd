extends Node

var score = 0
var is_game_over = false

func _process(delta: float) -> void:
	if is_game_over and Input.is_action_just_pressed("fire"):
		restart_game()

func restart_game():
	get_tree().reload_current_scene()
	is_game_over = false
	score = 0
	
func add_score(points):
	if not is_game_over:
		score+=points
	
func set_is_game_over(value):
	is_game_over = value
