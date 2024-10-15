extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x < -50:
		self.queue_free()
	else:
		self.position.x -= 5


func _on_body_entered(body):
	if body == get_parent().get_parent().get_node("Plane"):
		get_parent().get_parent().plane_hit()
