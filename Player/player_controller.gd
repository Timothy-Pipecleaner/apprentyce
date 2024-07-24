extends CharacterBody2D
class_name PlayerController

const SPEED = 768 # px per sec

func _ready():
	pass

func _process(_delta):
	control_movement()
	move_and_slide()
	pass

func control_movement():
	var input := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input * SPEED
