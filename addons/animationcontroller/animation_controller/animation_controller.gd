extends Node
class_name AnimationController

@export var animation_list: Array[TopDownAnimation]
@export var animation_player: AnimationPlayer 

var animation_dictionary: Dictionary
var direction_value : Vector2 = Vector2.DOWN

const DIRECTION_PADDING := 0.4


func _enter_tree():
	for animation in animation_list:
		animation_dictionary[animation.name] = animation;

func play_animation(name: String):
	if animation_dictionary[name] == null: printerr("No animation with name: %s" % name)
	if direction_value.x > DIRECTION_PADDING:
		animation_player.play(animation_dictionary[name].right_animation)
	elif direction_value.x < -DIRECTION_PADDING:
		animation_player.play(animation_dictionary[name].left_animation)
	elif direction_value.y > DIRECTION_PADDING:
		animation_player.play(animation_dictionary[name].down_animation)
	elif direction_value.y < -DIRECTION_PADDING:
		animation_player.play(animation_dictionary[name].up_animation)

func play_animation_with_callback(name: String, callback: Callable):
	play_animation(name)
	await animation_player.animation_finished
	callback.call()
