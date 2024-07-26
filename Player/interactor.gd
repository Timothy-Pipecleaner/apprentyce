extends Area2D
class_name Interactor

var current: Interactable = null

func _enter_tree():
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)

func _exit_tree():
	area_entered.disconnect(on_area_entered)
	area_exited.disconnect(on_area_exited)

func interact():
	if current:
		current.interact()

func on_area_entered(other: Area2D):
	if other is Interactable:
		var interactable = other as Interactable
		if current:
			current.highlight(false)
		current = interactable
		current.highlight(true)

func on_area_exited(other: Area2D):
	if other is Interactable:
		var interactable = other as Interactable
		if interactable == current:
			interactable.highlight(false)
			current = null
