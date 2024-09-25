extends Node2D

var score = 0
@export var txtScore: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score == 5:
		get_tree().change_scene_to_file("res://scenes/VICTORY.tscn")

func coin_collected():
	score += 1
	txtScore.text = str(score)


func _on_world_border_body_entered(body):
	body.position = Vector2(72, 96)
