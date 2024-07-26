@tool
extends Control
class_name AnimationListEditor

var animation_list: Array[TopDownAnimation]:
	set(value):
		animation_list = value
		refresh_animation_list()

@export var animation_player_list: PackedStringArray

@export var animation_editor_scene = preload("res://addons/animationcontroller/ui/top_down_animation_editor.tscn")

@export var add_button: Button
@export var remove_button: Button

@export var animation_list_container: Control

signal add_anim
signal remove_anim
signal animation_edited

func _enter_tree():
	add_button.pressed.connect(func(): add_anim.emit())
	remove_button.pressed.connect(func(): remove_anim.emit())
	refresh_animation_list()

func refresh_animation_list():
	custom_minimum_size.y = 108.0 * len(animation_list)
	for node in animation_list_container.get_children():
		animation_list_container.remove_child(node)
		node.queue_free()
	
	for animation in animation_list:
		var animation_editor = animation_editor_scene.instantiate() as TopDownAnimationEditor
		animation_editor.animation_list = animation_player_list
		animation_editor.edited_object = animation
		animation_editor.animation_edited.connect(func(): animation_edited.emit())
		animation_list_container.add_child(animation_editor)
