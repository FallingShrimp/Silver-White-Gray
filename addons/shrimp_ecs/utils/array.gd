class_name ShrimpArrayUtil

class ArrayZip extends RefCounted:
	var pairs: Array[Array]
	var current_index: int = 0

	func _init(xpairs: Array[Array]) -> void:
		pairs = xpairs
	
	func _iter_init(iter: Array) -> bool:
		print(iter)
		return false
