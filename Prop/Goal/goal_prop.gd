extends GridProp
class_name GoalProp

var grid_pos: Vector2i

signal goal_reached

func get_prop_type() -> PropType:
	return PropType.GOAL
