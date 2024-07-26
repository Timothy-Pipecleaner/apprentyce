extends GridProp
class_name GoalProp

var grid_pos: Vector2i

var reqs_met: bool = false:
	set(value):
		goal_met = value
		reqs_met_changed(value)

signal goal_reached

func get_prop_type() -> PropType:
	return PropType.GOAL

func reqs_met_changed(met: bool):
	if met:
		modulate = Color.RED
	else:
		modulate = Color.WHITE
