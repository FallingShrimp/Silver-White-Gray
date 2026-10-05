extends Node
class_name ShrimpEventLoop

enum ProcessCallback {
	PHYSICS,
	IDLE
}

@export var systems: Array[ShrimpBaseSystem] = []
@export var next_entity: int = 0
@export var process_callback: ProcessCallback = ProcessCallback.PHYSICS

var components: Dictionary[StringName, ShrimpComponentContainer] = {}

func _process(delta: float) -> void:
	if process_callback == ProcessCallback.IDLE:
		execute(delta)
func _physics_process(delta: float) -> void:
	if process_callback == ProcessCallback.PHYSICS:
		execute(delta)

func add_system(system: ShrimpBaseSystem):
	if system not in systems:
		systems.append(system)
func add_component(entity: int, component: ShrimpBaseComponent):
	var id = component.get_component_id()
	if id not in components:
		components[id] = ShrimpComponentContainer.new()
	components[id].attach(entity, component)
	return self
func query(uses: Array[StringName]) -> Array:
	var instances = uses.map(func(e: StringName): return components.get(e))
	instances.sort_custom(func(a: ShrimpComponentContainer, b: ShrimpComponentContainer): return len(b.instances) >= len(a.instances))
	if null in instances:
		return []
	var minInstance: ShrimpComponentContainer = instances[0]
	var results = []
	for entity in minInstance.iterate():
		var hasComponents = []
		var isValid = true
		for storage in instances:
			if not storage.has(entity):
				isValid = false
				break
			hasComponents.append(storage.get(entity))
		if isValid:
			results.append_array([entity, hasComponents])
	return results
func spawn(uses: Array[ShrimpBaseComponent]) -> int:
	var id = next_entity
	next_entity += 1
	for component in uses:
		add_component(id, component)
	return id
func execute(delta: float):
	for system in systems:
		system.execute(self, delta)
