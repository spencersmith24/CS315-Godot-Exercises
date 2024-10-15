extends Node2D

@export var rock_resource: Resource
@onready var plane_player = $Plane

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func plane_hit():
	$GameOver.visible = true
	$GameOver/AnimationPlayer.play("slide_in")
	$SFX/Thud.play()
	$RockTimer.stop()
	$Plane.visible = false
	$Plane.position = Vector2(220, 300)
	$Plane.process_mode = Node.PROCESS_MODE_DISABLED

func _on_rock_timer_timeout():
	var rock = rock_resource.instantiate()
	if (randf() < .5):
		# spawn rock at bottom
		rock.position = Vector2(plane_player.position.x + 1000, 550)
		get_node("Rocks").add_child(rock)
	else:
		# spawn rock at top and rotate rock
		rock.position = Vector2(plane_player.position.x + 1000, 90)
		rock.rotation_degrees = 180
		get_node("Rocks").add_child(rock)


func _on_button_pressed():
	$RockTimer.start()
	$Plane.visible = true
	$Plane.process_mode = Node.PROCESS_MODE_INHERIT
	$GameOver.visible = false
