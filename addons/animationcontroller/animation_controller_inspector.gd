extends EditorInspectorPlugin

var AnimationListEditorProperty = preload("res://addons/animationcontroller/animation_list_editor_property.gd")

func _can_handle(object):
	if object is AnimationController:
		return true
	return false

func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	var animController = object as AnimationController 
	if name == "animation_list":
		add_property_editor(name, AnimationListEditorProperty.new())
		return true
	return false
