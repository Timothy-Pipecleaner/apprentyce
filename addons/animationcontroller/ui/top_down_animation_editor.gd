@tool
extends Control
class_name TopDownAnimationEditor

var edited_object: TopDownAnimation
var animation_list: PackedStringArray:
	set(value):
		for animation_string in value:
			left_anim_button.add_item(animation_string)
			right_anim_button.add_item(animation_string)
			up_anim_button.add_item(animation_string)
			down_anim_button.add_item(animation_string)
		animation_list = value


@export var left_anim_button: OptionButton
@export var right_anim_button: OptionButton
@export var up_anim_button: OptionButton
@export var down_anim_button: OptionButton
@export var name_edit: LineEdit

signal animation_edited

func _enter_tree():
	left_anim_button.selected = animation_list.find(edited_object.left_animation)
	right_anim_button.selected = animation_list.find(edited_object.right_animation)
	up_anim_button.selected = animation_list.find(edited_object.up_animation)
	down_anim_button.selected = animation_list.find(edited_object.down_animation)
	name_edit.text = edited_object.name
	
	name_edit.text_changed.connect(func(new_value):
		edited_object.name = new_value
		animation_edited.emit())
	left_anim_button.item_selected.connect(func(index): 
		edited_object.left_animation = animation_list[index]
		animation_edited.emit())
	right_anim_button.item_selected.connect(func(index): 
		edited_object.right_animation = animation_list[index]
		animation_edited.emit())
	up_anim_button.item_selected.connect(func(index): 
		edited_object.up_animation = animation_list[index]
		animation_edited.emit())
	down_anim_button.item_selected.connect(func(index): 
		edited_object.down_animation = animation_list[index]
		animation_edited.emit())
	

