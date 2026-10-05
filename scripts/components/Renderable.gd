extends ShrimpBaseComponent
class_name Renderable

func get_component_id() -> StringName:
	return "renderable"
func get_dependencies() -> Array[ShrimpBaseComponent]:
	return [Transformable.new()]
