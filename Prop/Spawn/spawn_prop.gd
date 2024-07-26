@tool
extends GridProp
class_name SpawnProp

var tool_texture : Texture2D = preload("res://Prop/Spawn/player_tool.tres")

func get_prop_type():
	return PropType.SPAWN_POINT
	
func _draw():
	if(Engine.is_editor_hint()):
		draw_texture(tool_texture, (Vector2.ZERO - tool_texture.get_size() / 2) + Vector2.UP * 61 , Color(1, 1, 1, 0.6))
