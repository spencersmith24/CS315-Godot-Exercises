extends Area2D

var score = 0

func _on_body_entered(body: Node2D) -> void:
	
	if body is CharacterBody2D:
		var collision_normal = (body.global_transform.origin - global_transform.origin).normalized()
		body.velocity = body.velocity.bounce(collision_normal)
		
	get_parent().get_parent().update_score()

	self.queue_free()
