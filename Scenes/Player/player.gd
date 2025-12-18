extends CharacterBody2D

@export var speed: float

func _physics_process(_delta: float) -> void:
    var y_input = Input.get_axis("up","down")
    var x_input = Input.get_axis("left","right")
    velocity.x = x_input * speed
    velocity.y = y_input * speed
    move_and_slide()