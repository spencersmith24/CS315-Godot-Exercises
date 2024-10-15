extends Node2D

@export var brick_resource: Resource
@export var txtScore: Node

var brick_space: Vector2 = Vector2(100, 50)
var brick_array: Vector2 = Vector2(8, 11)

var score = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 

func setup():
	var ref_position: Vector2 = $ref_Brick.position

	for i in range(brick_array.x):
		for j in range(brick_array.y):
			var brick = brick_resource.instantiate()
			brick.position = ref_position + Vector2(j * brick_space.x, i * brick_space.y)
			$Bricks.add_child(brick)
			

func update_score():
	score += 1
	txtScore.text = str(score)
