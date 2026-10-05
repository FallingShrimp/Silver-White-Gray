extends RefCounted
class_name ShrimpComponentContainer

## EntityID -> ComponentInstance
var instance_index: Dictionary[int, int]
var instances: Array[ShrimpBaseComponent]
## ComponentInstance -> EntityID
var entity_ids: Array[int]

func is_attached(entity: int):
	return entity in instance_index
func seek(entity: int) -> ShrimpBaseComponent:
	return instances[instance_index[entity]]
func attach(entity: int, instance: ShrimpBaseComponent) -> ShrimpComponentContainer:
	if entity in instance_index:
		instances[instance_index[entity]] = instance
	else:
		instance_index[entity] = len(instances)
		instances.append(instance)
		entity_ids.append(entity)
	return self
func detach(entity: int):
	if entity not in instance_index: return
	var currentInstanceIndex = instance_index[entity]
	var lastInstanceIndex = len(instances) - 1
	match [instances[lastInstanceIndex], instances[currentInstanceIndex]]:
		[ var a, var b]:
			instances[currentInstanceIndex] = a
			instances[lastInstanceIndex] = b
	match [entity_ids[lastInstanceIndex], entity_ids[currentInstanceIndex]]:
		[ var a, var b]:
			entity_ids[currentInstanceIndex] = a
			entity_ids[lastInstanceIndex] = b
	instance_index[entity_ids[currentInstanceIndex]] = currentInstanceIndex
	instance_index.erase(entity)
	instances.pop_back()
	entity_ids.pop_back()
func iterate() -> ShrimpArrayUtil.ArrayZip:
	return ShrimpArrayUtil.ArrayZip.new([entity_ids, instances])
