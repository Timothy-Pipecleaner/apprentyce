extends Area2D
class_name Interactor

var current: Interactable = null

func interact():
	current.interact()

func on_area_entered(other: Area2D):
	if other is Interactable:
		if current:
			current.highlight(false)
		current = other
		current.highlight(true)

func on_area_exited(other: Area2D):
	if other is Interactable:
		if other == current:
			current.highlight(false)
