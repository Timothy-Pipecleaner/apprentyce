extends Node2D
class_name GameController

@export var player_scene: PackedScene
@export var tile_map: TileMap

func _ready():
	var props = get_tree().get_nodes_in_group('props')
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
		
		if grid_prop.get_prop_type() == GridProp.PropType.SPAWN_POINT:
			if has_spawned:
				grid_prop.queue_free()
				continue
			
			var player: PlayerController = player_scene.instantiate() 
			get_parent().call_deferred('add_child', player)
			player.global_position = prop_global_pos
			grid_prop.queue_free()
			
			has_spawned = true;
