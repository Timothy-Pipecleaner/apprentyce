extends Node2D
class_name GameController

@export var player_scene: PackedScene
@export var tile_map: TileMap

@export_category("Level Setup Flags")
@export var has_player: bool = false
@export var has_goal: bool = false

func _ready():
	var props = get_tree().get_nodes_in_group(Groups.PROPS)
	var has_spawned: bool = false
	for prop in props:
		var grid_prop = prop as GridProp
		if grid_prop == null:
			prop.queue_free()
			continue
		
		# snap all to center of grid
		var map_pos = tile_map.local_to_map(tile_map.to_local(grid_prop.global_position))
		var prop_global_pos = tile_map.to_global(tile_map.map_to_local(map_pos))
		grid_prop.global_position = prop_global_pos
		
		match grid_prop.get_prop_type():
			GridProp.PropType.SPAWN_POINT:
				setup_spawn_prop(grid_prop)
				break
			GridProp.PropType.GOAL:
				setup_goal_prop(grid_prop, map_pos)
				break
					

func setup_spawn_prop(prop: GridProp) -> void:
	if has_player:
		prop.queue_free()
		printerr("WARNING: This level has multiple spawn props only the first one will be used.")
		return
		
	var player: PlayerController = player_scene.instantiate() 
	get_parent().call_deferred('add_child', player)
	player.global_position = prop.global_position
	prop.queue_free()
	
	has_player = true;

func setup_goal_prop(prop: GridProp, grid_pos: Vector2i) -> void:
	if has_goal:
		prop.queue_free()
		printerr("WARNING: This level has multiple goals only the first one will be used.")
		return
	
	var goal_prop = prop as GoalProp
	
	if prop == null:
		prop.queue_free()
		printerr("WARNING: Invalid Prop with a PropType of Goal found.")
		return
	
	goal_prop.grid_pos = grid_pos
	
