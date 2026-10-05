@abstract
extends RefCounted
class_name ShrimpBaseComponent

@abstract func get_component_id() -> StringName
func get_dependencies() -> Array[ShrimpBaseComponent]:
	return []
