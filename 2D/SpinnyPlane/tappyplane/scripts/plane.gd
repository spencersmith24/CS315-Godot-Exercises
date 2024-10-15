extends RigidBody2D

var flap_dir = Vector2(0, -550)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("flap")):
		apply_impulse(flap_dir)
		$AnimatedSprite2D.play("flap")
		$Flap.play()


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("glide")
