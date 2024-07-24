@tool
extends GridProp
class_name CandleProp

@export var starts_lit: bool = false:
	set(value):
		starts_lit = value
		tool_starts_lit_changed(value)

@export_category("Components")
@export var sprite: Sprite2D

func get_prop_type():
	return PropType.CANDLE

func tool_starts_lit_changed(new_value: bool):
	if Engine.is_editor_hint():
		sprite.frame = 1 if new_value else 0
