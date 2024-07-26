@tool
extends GridProp
class_name CandleProp

@export var lit: bool = false:
	set(value):
		lit = value
		on_lit_changed(value)

@export_group("Components")
@export var sprite: Sprite2D
@export var interactable: Interactable

signal lit_changed(is_lit: bool)

func _init():
	super()
	goal_met = lit

func _enter_tree():
	if Engine.is_editor_hint(): return
	interactable.interacted.connect(on_interactable_interacted)

func _exit_tree():
	if Engine.is_editor_hint(): return
	interactable.interacted.disconnect(on_interactable_interacted)

func get_prop_type() -> PropType:
	return PropType.CANDLE

func is_goal_requirement() -> bool:
	return true

func on_lit_changed(is_lit: bool) -> void:
	sprite.frame = 1 if is_lit else 0
	if Engine.is_editor_hint(): return
	goal_met = is_lit

func on_interactable_interacted():
	lit = !lit
