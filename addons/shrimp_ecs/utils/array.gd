class_name ShrimpArrayUtil

class ArrayZip extends RefCounted:
	var pairs: Array[Array]
	var current_index: int = 0

	func _init(xpairs: Array[Array]) -> void:
		pairs = xpairs
	func _iter_init(_iter: Array) -> bool:
		return current_index < length()
	func _iter_next(iter: Array) -> bool:
		current_index += 1
		return _iter_init(iter)
	func _iter_get(_iter: Variant) -> Array:
		return pairs.map(func(e: Array): return e[current_index])
	
	func length() -> int:
		return pairs.map(len).min()
