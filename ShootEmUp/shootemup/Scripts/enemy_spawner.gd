extends Node2D

@export var enemy_resource: Resource

var rng = RandomNumberGenerator.new()
var win_width = DisplayServer.window_get_size().x

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	rng.randomize()
	var enemy = enemy_resource.instantiate()
	enemy.position = Vector2(rng.randi_range(50, win_width - 50), 0)
	add_child(enemy)
