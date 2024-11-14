extends CharacterBody3D

@onready var pivot := $Pivot
@onready var camera := $Pivot/Camera3D
@onready var raycast := $Pivot/Camera3D/RayCast3D
@onready var pinjoint := $PinJoint3D

func _process(delta: float) -> void:
	if Input.is_action_just_released("rightclick"):
		if raycast.is_colliding():
			var collisionTarget = raycast.get_collider()
			if collisionTarget.is_in_group("box"):
				pinjoint.set_node_b(collisionTarget.get_path())
	
	if Input.is_action_just_pressed("release"):
		pinjoint.set_node_b("")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			pivot.rotate_y(-event.relative.x * 0.005)
			camera.rotate_x(-event.relative.y * 0.005)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction = (pivot.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
