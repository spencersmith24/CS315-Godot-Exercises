extends CharacterBody2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	set_velocity(Vector2(rng.randi_range(140, 210), 200))


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
	
func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
