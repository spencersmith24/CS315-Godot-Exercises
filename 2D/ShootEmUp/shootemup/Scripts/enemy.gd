extends RigidBody2D

const SPEED = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity = Vector2.DOWN.normalized() * SPEED


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name.match("Bullet"):
		get_parent().get_parent().increment_score()
		queue_free()
		body.queue_free()
	elif body.name.match("Player"):
		body.queue_free()
		queue_free()
