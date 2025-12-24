extends Control
@onready var score_label: Label = $PanelContainer/MarginContainer/VBoxContainer/ScoreLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GameManager.is_game_over:
		visible = true
		score_label.text = "Your score: " + str(GameManager.score)
