extends Area2D
class_name Interactable

var active: bool = true

signal interacted()
signal highlighted(highlight: bool)

func interact() -> void:
	if !active: return
	interacted.emit()

func highlight(has_highlight: bool) -> void:
	if !active:
		highlighted.emit(false)
		return
	highlighted.emit(has_highlight)
	
