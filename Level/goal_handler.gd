extends Node
class_name GoalHandler

var total_reqs: int = 0
var reqs_met: int = 0

var goal: GoalProp

signal all_reqs_met(met: bool)

func add_goal_requirement(prop: GridProp):
	prop.goal_met_changed.connect(on_prop_requirement_met)
	total_reqs += 1
	if prop.goal_met:
		reqs_met += 1

	all_reqs_met.emit(reqs_met >= total_reqs)

func on_prop_requirement_met(met: bool):
	if met:
		reqs_met += 1
	else:
		reqs_met -= 1
		
	all_reqs_met.emit(reqs_met >= total_reqs)

func add_goal(goal: GoalProp):
	if self.goal:
		return
	
	if reqs_met >= total_reqs:
		goal.reqs_met = true
	
	all_reqs_met.connect(goal.reqs_met_changed)
