extends Node2D
class_name GridProp

enum PropType {
	EMPTY,
	SPAWN_POINT,
	CANDLE,
	GOAL,
	EXIT
}

func _init():
	add_to_group(Groups.PROPS)

# override to get the correct prop type
func get_prop_type() -> PropType:
	return PropType.EMPTY
