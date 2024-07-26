extends EditorProperty

var list_control: AnimationListEditor = preload("res://addons/animationcontroller/ui/animation_list_editor.tscn").instantiate()

var current_value: Array[TopDownAnimation] = []

func _init():
	add_child(list_control)
	list_control.add_anim.connect(add_anim)
	list_control.remove_anim.connect(remove_anim)
	list_control.animation_edited.connect(animation_edited)

func add_anim():
	current_value.append(TopDownAnimation.new())
	list_control.animation_list = current_value
	emit_changed(get_edited_property(), current_value)

func remove_anim():
	current_value.remove_at(len(current_value) - 1)
	list_control.animation_list = current_value
	emit_changed(get_edited_property(), current_value)

func animation_edited():
	emit_changed(get_edited_property(), current_value)

func _update_property():
	var new_value = get_edited_object()[get_edited_property()]
	var animation_player: AnimationPlayer = get_edited_object()["animation_player"]
	if (new_value == current_value):
		return
	
	current_value = new_value
	list_control.animation_player_list = animation_player.get_animation_list()
	list_control.animation_list = current_value;
