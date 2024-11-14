extends Area3D

@export var desiredColor : String


func _on_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("box"):
		#is this the desired color
		if body.cubeColor == desiredColor:
			get_node("/root/pushingPuzzle").collectCube()
			body.queue_free()
			print("YAY")
		#if not, tell game controller
