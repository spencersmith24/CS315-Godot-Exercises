extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		$Ball.apply_force(Vector3(0, 0, -500))


func _on_bucket_body_entered(body):
	$Ball.queue_free()
