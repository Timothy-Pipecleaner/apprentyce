extends Node2D
class_name GridProp

enum PropType {
	EMPTY,
	SPAWN_POINT,
	CANDLE,
	GOAL,
	EXIT
}

var goal_met: bool = false:
	set(value):
		goal_met = value
		goal_met_changed.emit(value)

signal goal_met_changed(new_value: bool)

func _init():
	add_to_group(Groups.PROPS)

# override to get the correct prop type
func get_prop_type() -> PropType:
	return PropType.EMPTY

func is_goal_requirement() -> bool:
	return false
