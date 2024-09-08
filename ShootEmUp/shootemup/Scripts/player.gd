extends CharacterBody2D

@export var bullet_resource: Resource

const SPEED = 500.0

func _ready():
	position = Vector2(576, 550)

func _process(delta):
	shoot_bullet()

func _physics_process(delta):
	var ship_direction: Vector2
	
	if Input.is_action_pressed("left"):
		ship_direction += Vector2.LEFT
	if Input.is_action_pressed("right"):
		ship_direction += Vector2.RIGHT
	if Input.is_action_pressed("up"):
		ship_direction += Vector2.UP
	if Input.is_action_pressed("down"):
		ship_direction += Vector2.DOWN
	
	velocity = ship_direction.normalized() * SPEED
	move_and_slide()


func shoot_bullet():
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_resource.instantiate()
		bullet.position.y -= 80
		add_child(bullet)
