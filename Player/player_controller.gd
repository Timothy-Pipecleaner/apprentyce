extends CharacterBody2D
class_name PlayerController

@export_group("Components")
@export var interactor: Interactor
@export var animation_controller: AnimationController

const SPEED = 768 # px per sec
const IDLE = "Idle"

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		interactor.interact()

func _process(_delta):
	control_movement()
	move_and_slide()
	
	if velocity.length() > 0:
		animation_controller.direction_value = velocity
		animation_controller.play_animation(IDLE)

func control_movement():
	var input := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input * SPEED
